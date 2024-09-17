import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

final class AppModel extends Equatable {
  final Locale? currentLanguage;

  const AppModel({
    this.currentLanguage,
  });

  @override
  List<Object?> get props => [
        currentLanguage,
      ];
}
