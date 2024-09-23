import 'package:flutter/material.dart';
import '/core/extensions/context_extension.dart';

import '../../../core/extensions/string_extensions.dart';

part 'validate_type.dart';

mixin _Validator {
  String? _requiredField(
      {required String value, required BuildContext context}) {
    return value.isNotEmpty ? null : context.locale.requiredField;
  }

  String? _maxAndMinLengthControl(
      {required String value,
      required BuildContext context,
      int? max,
      int min = 0}) {
    var result = value.length < min ? context.locale.minLength(min) : null;

    if (result == null && max != null) {
      return value.length > max ? context.locale.maxLength(max) : null;
    }
    return result;
  }

  String? _requireWithMaxMin(
      {required String value,
      required BuildContext context,
      int? max,
      int min = 0}) {
    var returnValue = _requiredField(value: value, context: context);
    if (returnValue != null) return returnValue;

    return _maxAndMinLengthControl(
        value: value, context: context, max: max, min: min);
  }

  String? _email({required String value, required BuildContext context}) {
    var returnValue =
        _requireWithMaxMin(context: context, value: value, max: 40);
    if (returnValue != null) return returnValue;

    return value.isValidEmail ? null : context.locale.checkYourEmail;
  }
}
