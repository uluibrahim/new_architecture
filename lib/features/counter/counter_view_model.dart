import 'package:injectable/injectable.dart';
import 'package:new_architecture/core/view_model/view_model.dart';
import 'package:new_architecture/features/counter/counter_data.dart';

import '../../core/enum/app_state.dart';

@injectable
class CounterViewModel extends ViewModel<CounterData> {
  CounterViewModel() : super(const CounterData.initial());

  void incrementCounter() {
    updateState(counter: value.counter + 1);
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
