import 'package:flutter/material.dart';

import 'app.dart';
import 'product/init/application_initialize.dart';

void main() async {
  await ApplicationInitialize.initialize();
  runApp(const App());
}
