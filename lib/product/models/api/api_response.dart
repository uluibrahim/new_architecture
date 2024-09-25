import 'package:flutter/material.dart';

@immutable
final class ApiResponse {
  final bool isSuccess;
  final dynamic data;
  final String? description;
  final String? errorCode;

  const ApiResponse({
    required this.isSuccess,
    required this.data,
    required this.description,
    required this.errorCode,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        isSuccess: json["isSuccess"] ?? false,
        data: json["data"],
        description: json["description"],
        errorCode: json["errorCode"],
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "data": data,
        "description": description,
        "errorCode": errorCode,
      };
}
