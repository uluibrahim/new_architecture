import 'package:encrypt/encrypt.dart';

import '../env/app_environment.dart';

final class CustomEncrypter {
  static final Key _key = Key.fromBase16(AppEnvItems.aesKey.value);
  static final IV _iv = IV.fromBase16(AppEnvItems.aesInitializeVector.value);
  static final Encrypter _encrypter =
      Encrypter(AES(CustomEncrypter._key, mode: AESMode.cbc));

  static String encrypt(String data) =>
      _encrypter.encrypt(data, iv: CustomEncrypter._iv).base64;

  static String decrypt(String data) =>
      _encrypter.decrypt(Encrypted.fromBase64(data), iv: CustomEncrypter._iv);
}
