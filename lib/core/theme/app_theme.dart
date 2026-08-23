
import 'package:flutter/material.dart';

class AppTheme {
  static const Color background = Color(0xFF080B12);
  static const Color surface = Color(0xFF101521);
  static const Color surfaceLight = Color(0xFF171E2D);

  static const Color primary = Color(0xFF8B5CF6);
  static const Color secondary = Color(0xFF06B6D4);

  static const Color textPrimary = Color(0xFFF8FAFC);
  static const Color textSecondary = Color(0xFF94A3B8);

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: background,

    colorScheme: const ColorScheme.dark(
      primary: primary,
      secondary: secondary,
      surface: surface,
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: textSecondary,
      ),
      bodyMedium: TextStyle(
        color: textSecondary,
      ),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),

    cardTheme: CardThemeData(
      color: surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    ),
  );
}

