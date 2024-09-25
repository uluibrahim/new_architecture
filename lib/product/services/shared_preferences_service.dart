import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../enum/shared_preference_keys.dart';

abstract class ISharedPreferencesService {
  Future<bool> setToken(String token);
  String? getToken();

  String? getLanguage();
  Future<bool> setLanguage(String value);

  Future<bool> clearAllData();
}

@LazySingleton(as: ISharedPreferencesService)
class SharedPreferencesService implements ISharedPreferencesService {
  final SharedPreferences _prefs;

  SharedPreferencesService(this._prefs);

  @override
  String? getToken() {
    var value = _prefs.getString(PreferenceKeys.token.name);

    if (value != null) return value;
    return value;
  }

  @override
  Future<bool> setToken(String token) async =>
      await _prefs.setString(PreferenceKeys.token.name, token);

  @override
  String? getLanguage() => _prefs.getString(PreferenceKeys.language.name);

  @override
  Future<bool> setLanguage(String value) async =>
      await _prefs.setString(PreferenceKeys.language.name, value);

  @override
  Future<bool> clearAllData() async => await _prefs.clear();
}
