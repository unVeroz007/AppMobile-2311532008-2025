import 'package:flutter/material.dart';

class ThemeModel with ChangeNotifier {
  // Secara default, memakai tema 'light'
  ThemeMode _themeMode = ThemeMode.light;

  // Ini 'getter' agar widget lain bisa 'membaca' nilainya
  ThemeMode get themeMode => _themeMode;

  // Fungsi untuk mengganti tema
  void toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    // Beri tahu semua widget yang 'mendengar' bahwa state berubah
    notifyListeners();
  }
}