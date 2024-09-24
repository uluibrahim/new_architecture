import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../enum/request_type.dart';
import '../utils/env/app_environment.dart';

abstract class IApiClient {
  Future<Response> fetch({
    required String path,
    Map<String, String>? headers,
    Object? body,
    RequestType requestType = RequestType.get,
    bool useAuthorizationHeader = true,
  });
}

@LazySingleton(as: IApiClient)
final class ApiClient implements IApiClient {
  final String _baseUrl = AppEnvItems.baseUrl.value;

  late Map<String, String> _baseHeaders;

  ApiClient() {
    _baseHeaders = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
  }

  @override
  Future<Response> fetch({
    required String path,
    Map<String, String>? headers,
    Object? body,
    RequestType requestType = RequestType.get,
    bool useAuthorizationHeader = true,
  }) async {
    final Response response =
        await _sendRequest(requestType, path, body, headers);
    return response;
  }

  Future<Response> _sendRequest(
    RequestType requestType,
    String path,
    Object? body,
    Map<String, String>? headers,
  ) {
    final uri = _getUri(path);
    final header = _header({..._baseHeaders, ...?headers});
    final encodedBody = jsonEncode(body);

    switch (requestType) {
      case RequestType.post:
        return http.post(uri, body: encodedBody, headers: header);
      case RequestType.put:
        return http.put(uri, body: encodedBody, headers: header);
      case RequestType.patch:
        return http.patch(uri, body: encodedBody, headers: header);
      case RequestType.delete:
        return http.delete(uri, body: encodedBody, headers: header);
      case RequestType.get:
        return http.get(uri, headers: header);
    }
  }

  Uri _getUri(String path) {
    return Uri.parse(_baseUrl + path);
  }

  Map<String, String> _header(Map<String, String>? headers) {
    return {..._baseHeaders, ...?headers};
  }
}
