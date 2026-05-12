import 'dart:convert';
import 'package:http/http.dart' as http;
import 'meal_model.dart';

class MealService {
  static const String _base = 'https://www.themealdb.com/api/json/v1/1';

  static Future<List<MealSummary>> fetchByCategory(String category) async {
    final res = await http.get(Uri.parse('$_base/filter.php?c=$category'));
    if (res.statusCode == 200) {
      final data = json.decode(res.body);
      final list = data['meals'] as List?;
      if (list == null) return [];
      return list.map((e) => MealSummary.fromJson(e)).toList();
    }
    throw Exception('Failed to fetch meals');
  }

  static Future<List<String>> fetchCategories() async {
    final res = await http.get(Uri.parse('$_base/categories.php'));
    if (res.statusCode == 200) {
      final data = json.decode(res.body);
      final list = data['categories'] as List;
      return list.map((e) => e['strCategory'].toString()).toList();
    }
    throw Exception('Failed to fetch categories');
  }

  static Future<Meal?> fetchMealDetail(String id) async {
    final res = await http.get(Uri.parse('$_base/lookup.php?i=$id'));
    if (res.statusCode == 200) {
      final data = json.decode(res.body);
      final list = data['meals'] as List?;
      if (list == null || list.isEmpty) return null;
      return Meal.fromJson(list[0]);
    }
    throw Exception('Failed to fetch meal detail');
  }

  static Future<List<MealSummary>> searchMeals(String query) async {
    final res = await http.get(Uri.parse('$_base/search.php?s=$query'));
    if (res.statusCode == 200) {
      final data = json.decode(res.body);
      final list = data['meals'] as List?;
      if (list == null) return [];
      return list.map((e) => MealSummary.fromJson(e)).toList();
    }
    throw Exception('Failed to search meals');
  }
}
