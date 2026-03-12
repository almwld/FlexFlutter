import 'package:flutter/material.dart';

class AppTheme {
  static const Color goldColor = Color(0xFFFFD700);
  static const Color darkBg = Color(0xFF121212);

  // 1. الثيم الفاتح (النهاري) - أبيض ناصع مع تفاصيل واضحة
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: goldColor,
    scaffoldBackgroundColor: Colors.white,
    
    // إعدادات الـ AppBar في النهار
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    ),

    // إعدادات البطاقات (Cards) لتظهر تفاصيل المنتج
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Colors.grey.shade200), // إطار خفيف يحدد المنتج
      ),
    ),

    // ألوان النصوص في النهار
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.black87, fontSize: 14),
      titleLarge: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ),

    // ألوان الأيقونات العامة
    iconTheme: const IconThemeData(color: Colors.black87),
  );

  // 2. الثيم الداكن (الليلي) - الفخامة السوداء والذهبية
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: goldColor,
    scaffoldBackgroundColor: darkBg,
    
    appBarTheme: const AppBarTheme(
      backgroundColor: darkBg,
      elevation: 0,
      iconTheme: IconThemeData(color: goldColor),
      titleTextStyle: TextStyle(color: goldColor, fontSize: 20, fontWeight: FontWeight.bold),
    ),

    cardTheme: CardTheme(
      color: const Color(0xFF1E1E1E),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: goldColor.withOpacity(0.1)),
      ),
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.white70, fontSize: 14),
      titleLarge: TextStyle(color: goldColor, fontWeight: FontWeight.bold),
    ),

    iconTheme: const IconThemeData(color: goldColor),
  );
}
