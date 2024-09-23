import 'dart:async';
import 'package:flutter/material.dart';
import 'app.dart';
import 'core/error/error_handler.dart';
import 'product/init/application_initialize.dart';

void main() async {
  runZonedGuarded(
    () async {
      await ApplicationInitialize.initialize();
      runApp(App());
    },
    ErrorHandler.onError,
  );
}
