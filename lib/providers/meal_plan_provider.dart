import 'package:flutter/material.dart';

class MealPlanProvider
    extends ChangeNotifier {

  final List<Map<String, dynamic>>
      _mealPlans = [];

  List<Map<String, dynamic>>
      get mealPlans => _mealPlans;

  void addMealPlan({

    required String day,

    required String meal,

    required String time,

    required IconData icon,
  }) {

    _mealPlans.add({

      'day': day,

      'meal': meal,

      'time': time,

      'icon': icon,
    });

    notifyListeners();
  }

  void deleteMealPlan(int index) {

    _mealPlans.removeAt(index);

    notifyListeners();
  }
}