import 'package:flutter/material.dart';

@immutable
final class CustomSnackbar {
  static void show(
      {required BuildContext context,
      required String message,
      required Color color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: color,
      ),
    );
  }
}
