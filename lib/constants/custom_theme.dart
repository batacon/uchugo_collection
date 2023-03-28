import 'package:flutter/material.dart';
import 'package:uchugo_collection/constants/custom_color.dart';

final customTheme = ThemeData(
  primarySwatch: _customSwatch,
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF3B82C4),
    secondary: Color(0xFF3B82C4),
  ),
  textTheme: _customTextTheme,
);

const MaterialColor _customSwatch = MaterialColor(
  0xFF3B82C4,
  <int, Color>{
    50: Color(0xFF3B82C4),
    100: Color(0xFF3B82C4),
    200: Color(0xFF3B82C4),
    300: Color(0xFF3B82C4),
    400: Color(0xFF3B82C4),
    500: Color(0xFF3B82C4),
    600: Color(0xFF3B82C4),
    700: Color(0xFF3B82C4),
    800: Color(0xFF3B82C4),
    900: Color(0xFF3B82C4),
  },
);

TextTheme _customTextTheme = const TextTheme(
  displayLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: CustomColor.text),
  displayMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: CustomColor.text),
  displaySmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: CustomColor.text),
  bodyLarge: TextStyle(fontSize: 18, color: CustomColor.text),
  bodyMedium: TextStyle(fontSize: 16, color: CustomColor.text),
);
