import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  static const String _themeKey = 'isDark';
  bool _isDarkTheme = false;

  ThemeProvider() {
    _loadTheme();
  }

  bool get isDarkTheme => _isDarkTheme;

  void toggleTheme(bool value) {
    _isDarkTheme = value;
    _saveTheme(value);
    notifyListeners();
  }

  Future<void> _saveTheme(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_themeKey, value);
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkTheme = prefs.getBool(_themeKey) ?? false;
    notifyListeners();
  }
}
