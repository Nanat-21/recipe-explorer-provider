import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/meal_provider.dart';
import '../widgets/meal_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final provider =
        context.watch<MealProvider>();

    return Scaffold(

      backgroundColor:
          const Color(0xFFFFF8F2),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        title: const Text(
          'Favorite Recipes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: provider.favorites.isEmpty

          ? Center(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,

                children: const [

                  Icon(
                    Icons.favorite_border,
                    size: 80,
                    color: Colors.grey,
                  ),

                  SizedBox(height: 20),

                  Text(
                    'No favorite recipes yet',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    'Tap the heart icon to save recipes',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )

          : ListView.builder(

              padding:
                  const EdgeInsets.all(16),

              itemCount:
                  provider.favorites.length,

              itemBuilder: (context, index) {

                return MealCard(
                  meal:
                      provider.favorites[index],
                );
              },
            ),
    );
  }
}