import 'package:flutter/material.dart';
import 'i_app_theme.dart';
import 'i_theme.dart';

final class DarkTheme implements ITheme {
  static DarkTheme get instance => _instance ??= DarkTheme._();
  static DarkTheme? _instance;

  DarkTheme._() {
    _base = ThemeData.dark();
  }

  late final ThemeData _base;
  ThemeData? _theme;

  @override
  ThemeData get themeData {
    if (_theme != null) return _theme!;
    ThemeData baseTheme = AppTheme.instance.themeData(_base, ThemeMode.dark);
    _theme = _extraModify(baseTheme);
    return _theme!;
  }

  ThemeData _extraModify(ThemeData theme) {
    ThemeData modified = theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(primary: Colors.red),
    );
    return modified;
  }
}
