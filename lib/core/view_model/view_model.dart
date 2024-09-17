import 'package:flutter/foundation.dart';

import '../model/state_data.dart';

abstract class ViewModel<T extends StateData> implements ValueListenable<T> {
  ViewModel(T initial) : _stateDataNotifier = ValueNotifier(initial);

  final ValueNotifier<T> _stateDataNotifier;
  bool isDispose = false;

  @protected
  set stateData(T value) {
    if (isDispose) return;
    _stateDataNotifier.value = value;
  }

  @override
  T get value => _stateDataNotifier.value;

  @override
  void addListener(VoidCallback listener) {
    _stateDataNotifier.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _stateDataNotifier.removeListener(listener);
  }

  @mustCallSuper
  void dispose() {
    _stateDataNotifier.dispose();
    isDispose = true;
  }

  void updateState();
}
