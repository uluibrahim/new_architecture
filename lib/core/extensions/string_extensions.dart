import '../utils/encrypter/encrypter.dart';

extension StringExtension on String {
  bool get isValidEmail => RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
      ).hasMatch(this);
}

extension EncryptExtension on String {
  //Aes256
  String get encryptAes => CustomEncrypter.encrypt(this);

  String get decryptAes => CustomEncrypter.decrypt(this);
}
