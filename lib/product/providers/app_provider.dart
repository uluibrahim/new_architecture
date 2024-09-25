import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:new_architecture/product/services/shared_preferences_service.dart';

import '../enum/languages.dart';

import '../models/app_model.dart';
import '../utils/language_helper.dart';

abstract class IAppProvider implements ValueListenable<AppModel?> {
  Future<void> changeLanguage(Languages locale);

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
    );

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
}
