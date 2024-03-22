import 'package:flutter/material.dart';

class AppTheme {
  static const darkTheme = ColorScheme.dark(
      // primary: Color(0xFFF8D028),
      // onPrimary: Color(0xFF333333),
      // primaryContainer: Color(0xFFD0C000),
      // onPrimaryContainer: Color(0xFF333333),
      // secondary: Color(0xFF3B9DFF),
      // onSecondary: Color(0xFFF3F3F3),
      // secondaryContainer: Color(0xFFF0A000),
      // onSecondaryContainer: Color(0xFF333333),
      // error: Colors.redAccent,
      // onError: Colors.red,
      // errorContainer: Colors.redAccent,
      // onErrorContainer: Color(0xFFF9DEDC),
      // outline: Color(0xFF938F99),
      // background: Color(0xFF333333),
      // onBackground: Color(0xFFF3F3F3),
      // surface: Color(0xFF333333),
      // onSurface: Color(0xFFF3F3F3),
      // surfaceVariant: Color(0xFF49454F),
      // onSurfaceVariant: Color(0xFFCAC4D0),
      );

  static ColorScheme lightTheme = const ColorScheme.light(
      // primary: const Color(0xFFF8D028),
      // onPrimary: const Color(0xFF333333),
      // primaryContainer: const Color(0xFFFDD943),
      // onPrimaryContainer: const Color(0xFF333333),
      // secondary: const Color(0xFF3B9DFF),
      // onSecondary: const Color(0xFFF3F3F3),
      // secondaryContainer: Colors.amber.shade700,
      // onSecondaryContainer: const Color(0xFF333333),
      // error: Colors.redAccent,
      // onError: Colors.red,
      // errorContainer: Colors.redAccent,
      // onErrorContainer: const Color(0xFFF9DEDC),
      // outline: const Color(0xFF6F6D73),
      // background: const Color(0xFFF3F3F3),
      // onBackground: const Color(0xFF333333),
      // surface: const Color(0xFFFDCC34),
      // onSurface: const Color(0xFF333333),
      // surfaceVariant: const Color(0xFF57545B),
      // onSurfaceVariant: const Color(0xFF757575),
      );

  static final light = ThemeData(
    useMaterial3: true,
    fontFamily: 'Lato',
    // colorScheme: lightTheme,
  );
  static final dark = ThemeData(
    useMaterial3: true,
    fontFamily: 'Lato',
    // colorScheme: darkTheme,
  );
}
