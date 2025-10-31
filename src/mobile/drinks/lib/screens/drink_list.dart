import 'dart:async';

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../screens/drink_details.dart';

import '../services/api_drinks.dart';
import '../services/register_singleton.dart';

import '../l10n/app_localizations.dart';

import '../models/drink/drink_filter.dart';
import '../models/drink/drink.dart';
import '../models/api_results.dart';

class DrinkList extends StatefulWidget {
  const DrinkList({super.key});

  @override
  _DrinkListState createState() => _DrinkListState();
}

class _DrinkListState extends State<DrinkList> {
  final DrinksProxyService _apiService = getIt<DrinksProxyService>();

  Timer? _debounce;
  final Duration _debounceDuration = const Duration(milliseconds: 350);

  late final _pagingController = PagingController<int, Drink>(
    getNextPageKey: (state) {
      if (_metaData != null && _results.length >= _metaData!.total) {
        return null;
      }
      return (state.keys?.last ?? 0) + 1;
    },
    fetchPage: (pageKey) => loadData(pageKey),
  );

  List<Drink> _results = [];
  Meta? _metaData = null;
  DrinkFilter fillter = new DrinkFilter();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<List<Drink>> loadData(int page) async {
    if (_metaData != null && _results.length >= _metaData!.total) {
      return [];
    }

    var next = await _apiService.getAllAsync(fillter, page, 15);
    _results.addAll(next.data);
    _metaData = next.meta;

    return next.data;
  }

  void onSearchChanged(String name) {
    _debounce?.cancel();

    _debounce = Timer(_debounceDuration, () {
      fillter.name = name;
      _metaData = null;
      _results.clear();
      _pagingController.refresh();
    });
  }

  void handleDetails(Drink item) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DrinkDetails(drink: item,)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(t.translate('drinktTitle'))),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: onSearchChanged,
              decoration: InputDecoration(
                hintText: t.translate('searchDrink'),
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            child: PagingListener(
              controller: _pagingController,
              builder: (context, state, fetchNextPage) =>
                  PagedListView<int, Drink>(
                    state: state,
                    fetchNextPage: fetchNextPage,
                    builderDelegate: PagedChildBuilderDelegate(
                      itemBuilder: (context, item, index) => Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.lightBlue.withAlpha(50),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                item.imageUrl,
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                item.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.arrow_forward_ios),
                              onPressed: () => handleDetails(item),
                            ),
                          ],
                        ),
                      ),
                      noMoreItemsIndicatorBuilder: (context) =>
                          Center(child: Text(t.translate('everyDrinkListed'))),
                      noItemsFoundIndicatorBuilder: (_) =>
                          Center(child: Text(t.translate('noDrinks'))),
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
