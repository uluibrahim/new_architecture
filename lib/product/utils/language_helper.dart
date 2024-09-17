import 'package:flutter/material.dart';

mixin LanguageHelper {
  Locale getLocale(String? locale) {
    if (locale == 'tr') {
      return const Locale.fromSubtags(
          languageCode: 'tr', countryCode: 'TR', scriptCode: 'Türkçe');
    } else {
      return const Locale.fromSubtags(
          languageCode: 'en', countryCode: 'US', scriptCode: 'English');
    }
  }
}
