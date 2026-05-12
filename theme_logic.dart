import 'package:flutter/material.dart';

class ThemeLogic extends ChangeNotifier {
  bool _dark = false;

  bool get dark => _dark;
  ThemeMode get themeMode => _dark ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _dark = !_dark;
    notifyListeners();
  }
}
