import 'package:injectable/injectable.dart';
import 'package:new_architecture/features/login/login_data.dart';
import 'package:new_architecture/product/models/auth/login_request.dart';
import 'package:new_architecture/product/repositories/auth_repository.dart';
import 'package:new_architecture/product/services/shared_preferences_service.dart';

import '../../core/enum/app_state.dart';
import '../../core/view_model/view_model.dart';
import '../../product/models/auth/login_response.dart';

@injectable
class LoginViewModel extends ViewModel<LoginData> {
  final IAuthRepository _authRepository;
  final ISharedPreferencesService _shared;

  LoginViewModel(
    this._authRepository,
    this._shared,
  ) : super(const LoginData.initial());

  Future<bool> loging({
    required String email,
    required String password,
  }) async {
    updateState(state: AppState.busy);
    final request = LoginRequest(email: email, password: password);
    final LoginResponse response = await _authRepository.login(request);

    await _setTokenToShared(response.token);

    updateState();
    return response.userId.isNotEmpty;
  }

  Future<void> _setTokenToShared(String token) async {
    await _shared.setToken(token);
  }

  @override
  void updateState({
    AppState state = AppState.idle,
  }) {
    stateData = LoginData(
      appState: state,
    );
  }
}
