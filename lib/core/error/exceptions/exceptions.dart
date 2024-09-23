part 'base_exception.dart';

final class AuthException implements BaseException {
  final int statusCode;
  AuthException(this.statusCode);
}

final class CustomException implements BaseException {
  String? message;
  CustomException(this.message);
}
