import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:new_architecture/product/services/shared_preferences_service.dart';

import '../enum/languages.dart';

import '../models/app_model.dart';
import '../utils/language_helper.dart';

abstract class IAppProvider implements ValueListenable<AppModel?> {
  Future<void> changeLanguage(Languages locale);
  Future<void> changeTheme();

  void init();
}

@Singleton(as: IAppProvider)
class AppProvider with LanguageHelper implements IAppProvider {
  final ISharedPreferencesService _shared;
  AppProvider(this._shared)
      : _stateDataNotifier = ValueNotifier(const AppModel());

  final ValueNotifier<AppModel?> _stateDataNotifier;

  @override
  void init() {
    _stateDataNotifier.value = AppModel(
      currentLanguage: _getCurrentLanguage,
      themeMode: _getCurrentTheme,
    );
  }

  @override
  AppModel? get value => _stateDataNotifier.value;

  Locale get _getCurrentLanguage {
    String? languageValue = _shared.getLanguage();

    return getLocale(languageValue);
  }

  @override
  Future<void> changeLanguage(Languages value) async {
    Locale locale = getLocale(value.name);
    _stateDataNotifier.value = AppModel(
        currentLanguage: locale,
        themeMode: _stateDataNotifier.value?.themeMode);

    await _shared.setLanguage(value.name);
  }

  @override
  void addListener(VoidCallback listener) {
    _stateDataNotifier.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _stateDataNotifier.removeListener(listener);
  }

  @mustCallSuper
  void dispose() {
    _stateDataNotifier.dispose();
  }

  @override
  Future<void> changeTheme() async {
    _stateDataNotifier.value = AppModel(
      currentLanguage: _stateDataNotifier.value?.currentLanguage,
      themeMode: _stateDataNotifier.value?.themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light,
    );

    await _shared.setThemeMode(
        _stateDataNotifier.value?.themeMode?.name ?? ThemeMode.light.name);
  }

  ThemeMode get _getCurrentTheme {
    final String? themeValue = _shared.getThemeMode();

    return (themeValue == ThemeMode.light.name || themeValue == null)
        ? ThemeMode.light
        : ThemeMode.dark;
  }
}
