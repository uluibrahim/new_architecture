import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

import '../../core/enum/request_type.dart';
import '../../core/network/api_client.dart';
import '../enum/service_path.dart';
import '../models/api/api_response.dart';
import '../models/auth/login_request.dart';
import '../utils/api_response_helper.dart';

abstract class IAuthService {
  Future<ApiResponse> login({
    required LoginRequest data,
  });
}

@LazySingleton(as: IAuthService)
class AuthService implements IAuthService {
  final IApiClient _apiClient;

  AuthService(this._apiClient);

  @override
  Future<ApiResponse> login({required LoginRequest data}) async {
    Response response = await _apiClient.fetch(
      path: ServicePath.login.value,
      requestType: RequestType.post,
      body: data.toJson(),
      useAuthorizationHeader: false,
    );

    return ApiResponseHelper.apiResponseAsMap(response.body);
  }
}
