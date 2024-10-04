import 'package:flutter/material.dart';

import 'i_app_theme.dart';
import 'i_theme.dart';

final class LigthTheme implements ITheme {
  static LigthTheme get instance => _instance ??= LigthTheme._();
  static LigthTheme? _instance;

  LigthTheme._() {
    _base = ThemeData.light();
  }

  late final ThemeData _base;
  ThemeData? _theme;

  @override
  ThemeData get themeData {
    return _theme ??= AppTheme.instance.themeData(_base, ThemeMode.light);
  }
}
