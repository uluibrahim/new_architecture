import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../core/utils/env/app_environment.dart';
import '../../inject/dependency_injection.dart';

@immutable
final class ApplicationInitialize {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    AppEnvironment.setup();
    await initializeGetIt(Environment.prod);

    // Firebase Initialize must be here
    /*
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    */
  }
}
