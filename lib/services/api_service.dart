import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/meal_model.dart';

class ApiService {
  // We use the 'search' endpoint with an empty string to get a general list
  static const String _baseUrl = 'https://www.themealdb.com/api/json/v1/1/search.php?s=';

  Future<List<Meal>> fetchMeals() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        
        // The API returns a Map with a key called "meals"
        if (data['meals'] != null) {
          List<dynamic> mealsJson = data['meals'];
          return mealsJson.map((json) => Meal.fromJson(json)).toList();
        } else {
          return []; // Returns empty if no results found
        }
      } else {
        throw Exception('Failed to load meals');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  // Simulated POST for your Add Recipe screen
  Future<Meal> postMeal(Meal meal) async {
    await Future.delayed(const Duration(seconds: 1));
    return meal; 
  }

  // Simulated DELETE
  Future<void> deleteMeal(int id) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }
}