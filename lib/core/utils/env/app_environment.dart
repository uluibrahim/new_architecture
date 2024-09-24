import 'package:flutter/foundation.dart';

import 'app_env_configuration.dart';
import 'dev/env_dev.dart';
import 'prod/env_prod.dart';

part '../../../product/enum/app_env_items.dart';

@immutable
final class AppEnvironment {
  static late final AppEnvConfiguration _configuration;

  AppEnvironment.setup() {
    _configuration = kDebugMode ? EnvDev() : EnvProd();
  }
}
