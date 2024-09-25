import 'package:injectable/injectable.dart';
import 'package:new_architecture/features/login/login_data.dart';
import 'package:new_architecture/product/models/auth/login_request.dart';
import 'package:new_architecture/product/repositories/auth_repository.dart';

import '../../core/enum/app_state.dart';
import '../../core/view_model/view_model.dart';
import '../../product/models/auth/login_response.dart';

@injectable
class LoginViewModel extends ViewModel<LoginData> {
  final IAuthRepository _authRepository;
  LoginViewModel(this._authRepository) : super(const LoginData.initial());

  Future<bool> loging({
    required String email,
    required String password,
  }) async {
    updateState(state: AppState.busy);
    final request = LoginRequest(email: email, password: password);
    final LoginResponse response = await _authRepository.login(request);
    
    updateState();
    return response.userId.isNotEmpty;
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
