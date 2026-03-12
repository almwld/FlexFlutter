import 'package:flutter/material.dart';

class AppTheme {
  static const goldColor = Color(0xFFD4AF37);
  static const darkBg = Color(0xFF0D0D0D);
  static const lightBg = Color(0xFFF8F9FA);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: goldColor,
    scaffoldBackgroundColor: lightBg,
    colorScheme: ColorScheme.light(
      primary: goldColor,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
    cardTheme: const CardThemeData( // تم التصحيح هنا من CardTheme إلى CardThemeData
      color: Colors.white,
      elevation: 2,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: goldColor,
    scaffoldBackgroundColor: darkBg,
    colorScheme: const ColorScheme.dark(
      primary: goldColor,
      surface: Color(0xFF1A1A1A),
      onSurface: Colors.white,
    ),
    cardTheme: const CardThemeData( // تم التصحيح هنا أيضاً
      color: Color(0xFF1A1A1A),
      elevation: 0,
    ),
  );
}
