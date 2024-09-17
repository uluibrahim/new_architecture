import 'package:new_architecture/core/model/state_data.dart';

final class CounterData extends StateData {
  final int counter;

  const CounterData({
    super.appState,
    required this.counter,
  });

  const CounterData.initial() : counter = 0;

  @override
  List<Object?> get props => [
        super.appState,
        counter,
      ];
}
