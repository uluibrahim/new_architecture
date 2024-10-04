import 'package:flutter/material.dart';

import '../theme/custom_color_scheme.dart';

final class ThemeConstant {
  //Design Reference
  static const double referenceWidth = 375.0;
  static const double referenceHeight = 812.0;

  static CustomColorScheme themeColorScheme(ThemeMode themeMode) =>
      themeMode == ThemeMode.dark ? colorSchemeDark : colorSchemeLight;

  static const CustomColorScheme colorSchemeLight = CustomColorScheme(
    primary: Color(0xFF16579D),
    secondary: Color(0xFF23B5FF),
    accent1: Color(0xFF97DAFF),
    accent2: Color(0xFF16579D),
    error: Color(0xFFF65A5A),
    background: Color(0xFFFAFCFF),
  );

  static const CustomColorScheme colorSchemeDark = CustomColorScheme(
    primary: Color(0xFFD69616),
    secondary: Color(0xFF23B5FF),
    accent1: Color(0xFF97DAFF),
    accent2: Color(0xFF16579D),
    error: Color(0xFFF65A5A),
    background: Color(0xFF111F35),
  );
}
