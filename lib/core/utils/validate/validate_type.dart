part of 'validator.dart';

enum ValidatorType with _Validator {
  requiredField,
  email,
  password;

  String? validate({required String value, required BuildContext context}) {
    switch (this) {
      case ValidatorType.requiredField:
        return _requiredField(context: context, value: value);
      case ValidatorType.email:
        return _email(context: context, value: value);
      case ValidatorType.password:
        return _requireWithMaxMin(
            context: context, value: value, max: 12, min: 8);
    }
  }
}
