import 'package:flutter/material.dart';

class AppTheme {
  static const Color goldColor = Color(0xFFFFD700);
  static const Color darkBg = Color(0 pill: 0xFF121212);

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: goldColor,
    scaffoldBackgroundColor: Colors.black,
    cardColor: const Color(0xFF1E1E1E),
    colorScheme: const ColorScheme.dark(
      primary: goldColor,
      secondary: goldColor,
      surface: Color(0xFF1E1E1E),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.grey),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: goldColor,
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    cardColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: goldColor,
      secondary: Colors.orange,
      surface: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black87),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
    ),
  );
}
