import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension LocaleExtension on BuildContext {
  AppLocalizations get locale => AppLocalizations.of(this)!;
}

extension AutoRouteExtension on BuildContext {
  StackRouter get router => AutoRouter.of(this);
}
