part of '../../core/utils/env/app_environment.dart';

enum AppEnvItems {
  baseUrl,
  apiKey,
  aesKey,
  aesInitializeVector;

  String get value {
    try {
      switch (this) {
        case AppEnvItems.baseUrl:
          return AppEnvironment._configuration.baseUrl;
        case AppEnvItems.apiKey:
          return AppEnvironment._configuration.apiKey;
        case AppEnvItems.aesKey:
          return AppEnvironment._configuration.aesKey;
        case AppEnvItems.aesInitializeVector:
          return AppEnvironment._configuration.aesInitializeVector;
      }
    } catch (e) {
      throw Exception("AppEnvironment is not initialized");
    }
  }
}
