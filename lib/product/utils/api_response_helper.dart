import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../core/error/exceptions/exceptions.dart';
import '../models/api/api_response.dart';

@immutable
final class ApiResponseHelper {
  /// [source] decode
  /// [source] as Map<String,dynamic>
  static ApiResponse apiResponseAsMap(String source) {
    return ApiResponse.fromJson(jsonDecode(source) as Map<String, dynamic>);
  }

  /// Check response isSuccess and description
  /// If isSuccess false and description not null, will throw Custom exeption with description
  /// Description means error message
  static void checkResponse(ApiResponse response) {
    if (!response.isSuccess) {
      throw CustomException(response.description);
    }
  }
}
