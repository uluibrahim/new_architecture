import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:new_architecture/core/view_model/view_model.dart';
import 'package:new_architecture/features/counter/counter_data.dart';
import 'package:new_architecture/product/route/app_router.dart';

import '../../core/enum/app_state.dart';

@injectable
class CounterViewModel extends ViewModel<CounterData> {
  CounterViewModel() : super(const CounterData.initial());

  void incrementCounter() {
    updateState(counter: value.counter + 1);
  }

  void goToSettingsPage(BuildContext context) {
    context.router.push(const SettingsRoute());
  }

  @override
  void updateState({
    AppState state = AppState.idle,
    int? counter,
  }) {
    stateData = CounterData(
      appState: state,
      counter: counter ?? value.counter,
    );
  }
}
