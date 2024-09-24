import 'package:envied/envied.dart';
import '/core/utils/env/app_env_configuration.dart';
part 'env_prod.g.dart';

@Envied(
  obfuscate: true,
  path: 'assets/env/.prod.env',
)
final class EnvProd implements AppEnvConfiguration {
  @EnviedField(varName: 'BASE_URL')
  static final String _baseUrl = _EnvProd._baseUrl;

  @EnviedField(varName: 'API_KEY')
  static final String _apiKey = _EnvProd._apiKey;

  @override
  String get baseUrl => _baseUrl;

  @override
  String get apiKey => _apiKey;
}
