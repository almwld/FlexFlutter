import 'package:flutter/material.dart';

class AppTheme {
  static const goldColor = Color(0xFFD4AF37);
  static const darkBg = Color(0xFF0D0D0D);
  static const cardDark = Color(0xFF1A1A1A); // هذا المتغير الذي تسبب بالخطأ

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: goldColor,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(
      primary: goldColor,
      surface: Colors.white,
    ),
    cardTheme: const CardThemeData(color: Colors.white, elevation: 2),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: goldColor,
    scaffoldBackgroundColor: darkBg,
    colorScheme: const ColorScheme.dark(
      primary: goldColor,
      surface: cardDark,
    ),
    cardTheme: const CardThemeData(color: cardDark, elevation: 0),
  );
}
