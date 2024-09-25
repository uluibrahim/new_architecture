import 'package:flutter/material.dart';
import 'package:new_architecture/core/screen/screen.dart';
import 'package:new_architecture/features/login/login_view_model.dart';
import 'login_data.dart';

part 'login_view_mixin.dart';

class LoginScreen extends Screen {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState
    extends ScreenState<LoginScreen, LoginViewModel, LoginData> with LoginViewMixin {
  @override
  Widget buildScreen(BuildContext context) {
     return Scaffold(
      body: _body,
    );
  }
}
