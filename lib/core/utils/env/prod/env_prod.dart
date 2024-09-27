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

  @EnviedField(varName: 'AES_KEY')
  static final String _aesKey = _EnvProd._aesKey;

  @EnviedField(varName: 'AES_INITIALIZE_VECTOR')
  static final String _aesInitializeVector = _EnvProd._aesInitializeVector;

  @override
  String get baseUrl => _baseUrl;

  @override
  String get apiKey => _apiKey;

  @override
  String get aesInitializeVector => _aesInitializeVector;

  @override
  String get aesKey => _aesKey;
}
