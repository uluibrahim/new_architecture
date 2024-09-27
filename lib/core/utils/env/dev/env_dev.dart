import 'package:envied/envied.dart';
import '/core/utils/env/app_env_configuration.dart';
part 'env_dev.g.dart';

@Envied(
  obfuscate: true,
  path: 'assets/env/.dev.env',
)
final class EnvDev implements AppEnvConfiguration {
  @EnviedField(varName: 'BASE_URL')
  static final String _baseUrl = _EnvDev._baseUrl;

  @EnviedField(varName: 'API_KEY')
  static final String _apiKey = _EnvDev._apiKey;

  @EnviedField(varName: 'AES_KEY')
  static final String _aesKey = _EnvDev._aesKey;

  @EnviedField(varName: 'AES_INITIALIZE_VECTOR')
  static final String _aesInitializeVector = _EnvDev._aesInitializeVector;

  @override
  String get baseUrl => _baseUrl;

  @override
  String get apiKey => _apiKey;

  @override
  String get aesInitializeVector => _aesInitializeVector;

  @override
  String get aesKey => _aesKey;
}
