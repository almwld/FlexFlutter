import 'package:flutter/material.dart';

class AppTheme {
  static const goldColor = Color(0xFFD4AF37);
  static const darkBg = Color(0xFF000000);
  static const lightBg = Color(0xFFF5F5F5);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: goldColor,
    scaffoldBackgroundColor: lightBg,
    cardColor: Colors.white,
    dividerColor: Colors.grey[300],
    colorScheme: const ColorScheme.light(
      primary: goldColor,
      onPrimary: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0.5,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: goldColor,
      unselectedItemColor: Colors.grey,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: goldColor,
    scaffoldBackgroundColor: darkBg,
    cardColor: Color(0xFF1A1A1A),
    colorScheme: const ColorScheme.dark(
      primary: goldColor,
      onPrimary: Colors.black,
      surface: Color(0xFF121212),
    ),
  );
}
