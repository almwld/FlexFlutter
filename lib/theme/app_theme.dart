import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static const Color goldColor = Color(0xFFD4AF37);
  static const Color darkBackground = Color(0xFF121212);
  static const Color cardDark = Color(0xFF1A1A1A);

  static ThemeData get lightTheme => ThemeData(
    fontFamily: 'Cairo',
    brightness: Brightness.light,
    primaryColor: goldColor,
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    cardTheme: const CardThemeData(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
    ),
  );

  static ThemeData get darkTheme => ThemeData(
    fontFamily: 'Cairo',
    brightness: Brightness.dark,
    primaryColor: goldColor,
    scaffoldBackgroundColor: darkBackground,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    cardTheme: CardThemeData(
      elevation: 4,
      color: cardDark,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
    ),
  );
}
