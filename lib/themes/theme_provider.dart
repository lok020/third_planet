import 'package:flutter/material.dart';
import 'package:third_planet/themes/light_mode.dart';
import 'package:third_planet/themes/dark_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = darkMode;

  // theme data getter
  ThemeData get themeData => _themeData;

  // boolean to check if the current theme is dark mode
  bool get isDarkMode => _themeData == darkMode;

  // theme data setter
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    // Notify listeners to rebuild the UI
    notifyListeners();
  }

  // Toggle between light and dark mode
  void toggleTheme() {
    if (_themeData == lightMode) {
      _themeData = darkMode;
    } else {
      _themeData = lightMode;
    }
    // Notify listeners to rebuild the UI
    notifyListeners();
  } 
}