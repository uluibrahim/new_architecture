import 'package:flutter/material.dart';

@immutable
final class CustomColorScheme {
  final Color primary;
  final Color secondary;
  final Color accent1;
  final Color accent2;
  final Color error;
  final Color background;

  const CustomColorScheme({
    required this.primary,
    required this.secondary,
    required this.accent1,
    required this.accent2,
    required this.error,
    required this.background,
  });
}
