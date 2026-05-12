import 'package:flutter/material.dart';
import 'meal_model.dart';
import 'meal_service.dart';

class MealProvider extends ChangeNotifier {
  List<MealSummary> _meals = [];
  List<String> _categories = [];
  String _selectedCategory = 'Beef';
  bool _loading = false;
  String? _error;

  List<MealSummary> get meals => _meals;
  List<String> get categories => _categories;
  String get selectedCategory => _selectedCategory;
  bool get loading => _loading;
  String? get error => _error;

  Future<void> loadCategories() async {
    try {
      _categories = await MealService.fetchCategories();
      notifyListeners();
    } catch (_) {}
  }

  Future<void> loadMealsByCategory(String category) async {
    _loading = true;
    _error = null;
    _selectedCategory = category;
    notifyListeners();
    try {
      _meals = await MealService.fetchByCategory(category);
    } catch (e) {
      _error = e.toString();
    }
    _loading = false;
    notifyListeners();
  }

  Future<void> loadInitial() async {
    await loadCategories();
    await loadMealsByCategory(_selectedCategory);
  }
}
