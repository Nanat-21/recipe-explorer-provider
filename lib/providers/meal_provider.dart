import 'package:flutter/material.dart';

import '../models/meal_model.dart';

class MealProvider extends ChangeNotifier {

  List<Meal> _allMeals = [];

  List<Meal> _meals = [];

  List<Meal> _favoriteMeals = [];

  bool isLoading = false;

  String error = '';

  List<Meal> get meals => _meals;

  List<Meal> get favorites =>
      _favoriteMeals;

  Future<void> getRecipes() async {

    try {

      isLoading = true;

      notifyListeners();

      await Future.delayed(
        const Duration(seconds: 1),
      );

      _allMeals = [

        Meal(

          id: 1,

          title: 'Doro Wat',

          description:
              'Traditional Ethiopian spicy chicken stew served with injera.',

          imageUrl:
              'data:image/webp;base64,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',

          category: 'Dinner',

          steps: [

            'Chop onions and cook slowly until soft.',

            'Add garlic, ginger and berbere spice.',

            'Add chicken pieces and cook thoroughly.',

            'Pour water and simmer for 30 minutes.',

            'Add boiled eggs and serve with injera.',
          ],
        ),

        Meal(

          id: 2,

          title: 'Firfir',

          description:
              'Shredded injera mixed with spicy Ethiopian sauce.',

          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtqjgk5AOQRcJHzkG-rkKiAYYln39SputxWsV8GtAhVbK5PydFkZxKuTPAYHI89AK0flxLZH4BdiTAqyDBPEx-RIFcva9QK-k4GVXyOhic&s=10',

          category: 'Breakfast',

          steps: [

            'Tear injera into bite-sized pieces.',

            'Cook onions in oil until golden.',

            'Add berbere spice and tomato.',

            'Mix the injera into the sauce.',

            'Cook for 5 minutes and serve hot.',
          ],
        ),

        Meal(

          id: 3,

          title: 'Kitfo',

          description:
              'Ethiopian minced beef mixed with butter and spices.',

          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2x4yTXeA6OixDcwHRn_RsDKEq1-SVkCIaolQhx0bs9kcevr5sXA4MSb_GS855baFSVWDnnSmlYjJYOygfKIyiS_cuyqQS6Uqs85grqsuzVg&s=10',

          category: 'Lunch',

          steps: [

            'Prepare fresh minced beef.',

            'Heat Ethiopian butter (kibbeh).',

            'Add mitmita spice and salt.',

            'Mix beef with butter and spices.',

            'Serve with cheese and greens.',
          ],
        ),

        Meal(

          id: 4,

          title: 'Chuko',

          description:
              'Traditional Ethiopian sweet snack made with roasted barley flour, butter, and sugar.',

          imageUrl:
              'data:image/jpeg;base64,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',
          category: 'Dessert',

          steps: [

            'Roast barley flour until aromatic.',

            'Melt Ethiopian butter in a pan.',

            'Mix the roasted flour with butter.',

            'Add sugar or honey for sweetness.',

            'Serve warm with coffee or tea.',
            ],
        ),

        Meal(

          id: 5,

          title: 'Shiro',

          description:
              'Popular Ethiopian chickpea powder stew.',

          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmhGAxxULJ_67J9rc6IYyA0yxKkBfyLC5sScON5RmHD9Dt41ErIFLP_MVTaWpqjlQsdOd9doE07mUqK7ix7M_yHff1VM-wkuhIHBElBO6r8g&s=10',

          category: 'Dinner',

          steps: [

            'Cook onions and garlic.',

            'Add oil and berbere spice.',

            'Slowly mix shiro powder with water.',

            'Cook until thick and smooth.',

            'Serve hot with injera.',
          ],
        ),
      ];

      _meals = _allMeals;

    } catch (e) {

      error = e.toString();

    } finally {

      isLoading = false;

      notifyListeners();
    }
  }

  void searchMeals(String query) {

    if (query.isEmpty) {

      _meals = _allMeals;

    } else {

      _meals = _allMeals.where((meal) {

        return meal.title
            .toLowerCase()
            .contains(
              query.toLowerCase(),
            );

      }).toList();
    }

    notifyListeners();
  }

  void filterByCategory(
      String category) {

    if (category == 'All') {

      _meals = _allMeals;

    } else {

      _meals = _allMeals.where((meal) {

        return meal.category
            .toLowerCase() ==
            category.toLowerCase();

      }).toList();
    }

    notifyListeners();
  }

  void addMeal(Meal meal) {

    _allMeals.insert(0, meal);

    _meals = _allMeals;

    notifyListeners();
  }

  void deleteMeal(int? id) {

    _allMeals.removeWhere(
      (meal) => meal.id == id,
    );

    _favoriteMeals.removeWhere(
      (meal) => meal.id == id,
    );

    _meals = _allMeals;

    notifyListeners();
  }

  void toggleFavorite(
      Meal meal) {

    final exists =
        _favoriteMeals.any(
      (m) => m.id == meal.id,
    );

    if (exists) {

      _favoriteMeals.removeWhere(
        (m) => m.id == meal.id,
      );

    } else {

      _favoriteMeals.add(meal);
    }

    notifyListeners();
  }

  bool isFavorite(int? id) {

    return _favoriteMeals.any(
      (meal) => meal.id == id,
    );
  }
}