import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:new_architecture/core/components/custom_snackbar.dart';
import 'package:new_architecture/core/error/exceptions/exceptions.dart';

final class ErrorHandler {
  static late BuildContext myContext;
  static late VoidCallback resetState;

  static void init(BuildContext context, VoidCallback voidCallback) {
    myContext = context;
    resetState = voidCallback;
  }

  static void onError(Object error, StackTrace stackTrace) {
    _showLog(error, stackTrace);

    // If you want you can reset view state here
    //resetState();

    _exceptionActions(error);
  }

  static _showLog(Object error, StackTrace stackTrace) {
    const String title = 'Triggers asynchrounous error\n';
    final String errorType = 'Error Type: ${error.runtimeType}\n';
    final String errorExplanation = 'Error Explanation: $error\n';
    final String errorReason = 'Error Reason:\n $stackTrace';
    log(title + errorType + errorExplanation + errorReason);
  }

  static _exceptionActions(Object error) {
    if (error is BaseException) {
      switch (error) {
        case AuthException():
          // Action when throw AuthException
          break;
        case CustomException():
          // Action when throw AuthException
          break;
        case NetworkStatusException():
          _showSnackBar("Network Status Error!");
      }
    } else {
      // Default action
    }
  }

  static _showSnackBar(String message) {
    CustomSnackbar.show(
      context: myContext,
      message: message,
      color: Colors.red,
    );
  }
}
