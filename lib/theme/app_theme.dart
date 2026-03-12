import 'package:flutter/material.dart';

class AppTheme {
  static const Color goldColor = Color(0xFFFFD700);

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: goldColor,
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.grey[100],
    textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.black)),
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white, foregroundColor: Colors.black),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: goldColor,
      unselectedItemColor: Colors.grey,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: goldColor,
    scaffoldBackgroundColor: const Color(0xFF121212),
    cardColor: const Color(0xFF1E1E1E),
    textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white)),
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF121212), foregroundColor: goldColor),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: goldColor,
      unselectedItemColor: Colors.white70,
    ),
  );
}
