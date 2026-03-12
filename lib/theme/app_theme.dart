import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static const Color goldColor = Color(0xFFD4AF37);
  static const Color darkBackground = Color(0xFF121212);
  static const Color cardDark = Color(0xFF1A1A1A);
  static const Color lightBackground = Color(0xFFF5F5F5);
  static const Color cardLight = Colors.white;

  static ThemeData get lightTheme => ThemeData(
    fontFamily: 'Cairo',
    brightness: Brightness.light,
    primaryColor: goldColor,
    scaffoldBackgroundColor: lightBackground,
    useMaterial3: true,
    cardTheme: CardTheme(
      color: cardLight,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'Cairo',
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: goldColor,
      unselectedItemColor: Colors.grey,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black87),
      titleLarge: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[100],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      hintStyle: TextStyle(color: Colors.grey[600]),
    ),
  );

  static ThemeData get darkTheme => ThemeData(
    fontFamily: 'Cairo',
    brightness: Brightness.dark,
    primaryColor: goldColor,
    scaffoldBackgroundColor: darkBackground,
    useMaterial3: true,
    cardTheme: CardTheme(
      color: cardDark,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: cardDark,
      selectedItemColor: goldColor,
      unselectedItemColor: Colors.grey,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white70),
      titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[800],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      hintStyle: TextStyle(color: Colors.grey[400]),
    ),
  );
}
