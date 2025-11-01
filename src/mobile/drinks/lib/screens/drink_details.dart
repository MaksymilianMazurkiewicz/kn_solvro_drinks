import 'package:flutter/material.dart';

import '../services/api_drinks.dart';
import '../services/register_singleton.dart';
import '../l10n/app_localizations.dart';
import '../models/drink/drink.dart';

class DrinkDetails extends StatefulWidget {
  final BaseDrink drink;

  const DrinkDetails({super.key, required this.drink});

  @override
  _DrinkDetailsState createState() => _DrinkDetailsState();
}

class _DrinkDetailsState extends State<DrinkDetails> {
  final DrinksProxyService _apiService = getIt<DrinksProxyService>();
  ExtendDrink? _drinkDetails;

  @override
  void initState() {
    super.initState();
    loadDetails();
  }

  void loadDetails() async {
    final res = await _apiService.getDrinkAsync(widget.drink.id);
    setState(() {
      _drinkDetails = res.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    if (_drinkDetails == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final drink = _drinkDetails!;

    return Scaffold(
      appBar: AppBar(
        title: Text(drink.name ?? ''),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (drink.imageUrl != null && drink.imageUrl!.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  drink.imageUrl!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 16),
            Text(
              drink.name ?? '',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Chip(
                  label: Text(drink.category ?? ''),
                  backgroundColor: Colors.blue.shade100,
                ),
                const SizedBox(width: 8),
                Chip(
                  label: Text(drink.alcoholic
                      ? t.translate('alcoholic')
                      : t.translate('non-alcoholic')),
                  backgroundColor: Colors.red.shade100,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.local_bar, size: 20),
                const SizedBox(width: 4),
                Text(drink.glass ?? ''),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              t.translate('instruction'),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(drink.instructions ?? ''),
            const SizedBox(height: 16),
            Row(
              children: [
                Text('${t.translate('createdAt')}: '),
                Text(drink.createdAt ?? ''),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text('${t.translate('updatedAt')}: '),
                Text(drink.updatedAt ?? ''),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              t.translate('ingredients'),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: drink.ingredients.length,
              itemBuilder: (context, index) {
                final item = drink.ingredients[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                  child: ListTile(
                    leading: item.imageUrl != null && item.imageUrl!.isNotEmpty
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              item.imageUrl!,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          )
                        : const Icon(Icons.local_drink,
                            size: 40, color: Colors.blueGrey),
                    title: Text(item.name ?? t.translate('noName')),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${t.translate('measure')}: ${item.measure}"),
                        if (item.alcohol)
                          Text("${t.translate('percentage')}: ${item.percentage ?? '-'}%"),
                        if (item.description != null &&
                            item.description!.isNotEmpty)
                          Text(
                            item.description!
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
