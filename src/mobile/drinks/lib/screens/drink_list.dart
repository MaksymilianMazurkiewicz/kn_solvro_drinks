import 'package:flutter/material.dart';
import '../models/api_results.dart';
import '../models/drink.dart';
import '../services/api_drinks.dart';

class DrinkList extends StatelessWidget {
  final DrinksProxyService apiService = DrinksProxyService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Drinks')),
      body: FutureBuilder<ApiResults<Drink>>(
        future: apiService.getAllAsync(1, 15),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No posts found'));
          } else {
            final posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.meta.total,
              itemBuilder: (context, index) {
                final post = posts.data[index];
                return ListTile(
                  title: Text(post.name),
                  subtitle: Text(post.category),
                );
              },
            );
          }
        },
      ),
    );
  }
}
