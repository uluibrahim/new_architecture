import 'package:flutter/material.dart';

import '../constants/theme_constants.dart';
import 'custom_color_scheme.dart';

part 'app_theme.dart';

interface class IApptheme {
  TextTheme customTextTheme(ThemeData theme, CustomColorScheme colorScheme) {
    return theme.textTheme.copyWith(
      displayLarge: TextStyle(
        fontSize: 44,
        color: colorScheme.accent1,
      ),
    );
  }

  ColorScheme customColorScheme(ThemeData theme, CustomColorScheme scheme) {
    return theme.colorScheme.copyWith(
      primary: scheme.primary,
      secondary: scheme.secondary,
      error: scheme.error,
      onSecondary: scheme.accent2,
      onPrimary: scheme.accent1,
    );
  }

  AppBarTheme customAppBarTheme(
      ThemeData theme, CustomColorScheme colorScheme) {
    return theme.appBarTheme.copyWith(backgroundColor: colorScheme.background);
  }
}
