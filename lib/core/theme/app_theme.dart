part of 'package:new_architecture/core/theme/i_app_theme.dart';

@immutable
final class AppTheme extends IApptheme {
  static AppTheme get instance => _instance ??= AppTheme._();
  static AppTheme? _instance;

  AppTheme._();

  ThemeData themeData(ThemeData baseTheme, ThemeMode mode) {
    final CustomColorScheme colorScheme = mode == ThemeMode.light
        ? ThemeConstant.colorSchemeLight
        : ThemeConstant.colorSchemeDark;

    return baseTheme.copyWith(
      colorScheme: customColorScheme(baseTheme, colorScheme),
      textTheme: customTextTheme(baseTheme, colorScheme),
      appBarTheme: customAppBarTheme(baseTheme, colorScheme),
    );
  }
}
