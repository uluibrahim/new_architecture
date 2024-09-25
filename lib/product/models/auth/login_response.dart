import 'package:flutter/material.dart';

@immutable
final class LoginResponse {
  final String userId;
  final String email;
  final String name;
  final String surname;
  final String? phoneNumber;
  final String token;

  const LoginResponse({
    required this.userId,
    required this.email,
    required this.name,
    required this.surname,
    required this.phoneNumber,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        userId: json["userId"],
        email: json["email"],
        name: json["name"],
        surname: json["surname"],
        phoneNumber: json["phoneNumber"],
        token: json["token"],
      );
}
