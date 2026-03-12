import 'package:flutter/material.dart';

class AppTheme {
  static const Color goldColor = Color(0xFFFFD700);
  static const Color cardLight = Color(0xFFF5F5F5);
  static const Color cardDark = Color(0xFF1E1E1E);

  // 1. الثيم الفاتح (النهاري)
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: goldColor,
    
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    ),

    // الإصلاح هنا: استخدام CardTheme بدلاً من CardThemeData
    cardTheme: CardTheme(
      color: cardLight,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Colors.grey.shade200),
      ),
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black87),
      titleLarge: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ),
  );

  // 2. الثيم الداكن (الليلي)
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF121212),
    primaryColor: goldColor,
    
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF121212),
      elevation: 0,
      iconTheme: IconThemeData(color: goldColor),
      titleTextStyle: TextStyle(color: goldColor, fontSize: 20, fontWeight: FontWeight.bold),
    ),

    cardTheme: CardTheme(
      color: cardDark,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: goldColor.withOpacity(0.1)),
      ),
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white70),
      titleLarge: TextStyle(color: goldColor, fontWeight: FontWeight.bold),
    ),
  );
}
