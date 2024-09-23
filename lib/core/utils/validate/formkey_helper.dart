import 'package:flutter/material.dart';

mixin FormKeyHelper {
  static bool validateForm(GlobalKey<FormState> formKey) =>
      formKey.currentState?.validate() ?? false;

  static void saveForm(GlobalKey<FormState> formKey) {
    formKey.currentState?.save();
  }
}
