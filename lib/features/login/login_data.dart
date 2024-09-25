import 'package:new_architecture/core/model/state_data.dart';
final class LoginData extends StateData {
  const LoginData({
    super.appState,
  });

  const LoginData.initial();

  @override
  List<Object?> get props => [
        super.appState,
      ];
}
