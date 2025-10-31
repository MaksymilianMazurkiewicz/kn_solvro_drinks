import 'package:flutter/material.dart';

import '../services/api_drinks.dart';
import '../services/register_singleton.dart';

import '../l10n/app_localizations.dart';

import '../models/drink/drink_filter.dart';
import '../models/drink/drink.dart';
import '../models/api_results.dart';

class DrinkDetails extends StatefulWidget {
  final Drink drink;

  const DrinkDetails({super.key, required this.drink});

  @override
  _DrinkDetailsState createState() => _DrinkDetailsState();
}

class _DrinkDetailsState extends State<DrinkDetails> {
  final DrinksProxyService _apiService = getIt<DrinksProxyService>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.drink.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                widget.drink.imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.drink.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Chip(
                  label: Text(widget.drink.category),
                  backgroundColor: Colors.blue.shade100,
                ),
                const SizedBox(width: 8),
                Chip(
                  label: Text(widget.drink.alcoholic ? t.translate('alcoholic') : t.translate('non-alcoholic')),
                  backgroundColor: Colors.red.shade100,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.local_bar, size: 20),
                const SizedBox(width: 4),
                Text(widget.drink.glass),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              t.translate('instruction'),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(widget.drink.instructions),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(t.translate('ceatedAt')),
                Text(widget.drink.createdAt),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(t.translate('updatedAt')),
                Text(widget.drink.updatedAt),
              ],
            ),
          ],
        ),
      ),
    );

  }
}
