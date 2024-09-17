part of 'counter_view.dart';

// Write here view's widgets and functions
mixin CounterViewMixin
    on ScreenState<CounterScreen, CounterViewModel, CounterData> {
  final String _title = "Counter Page";
  final String _content = "You have pushed the button this many times:";

  PreferredSizeWidget get _appBar => AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_title),
      );

  Widget get _body => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_content),
            _counterText,
          ],
        ),
      );

  get _incrementCounterButton => FloatingActionButton(
        onPressed: viewModel.incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      );

  Selector<CounterData, int> get _counterText {
    return Selector<CounterData, int>(
      builder: (_, value, __) {
        return Text(
          value.toString(),
          style: Theme.of(context).textTheme.headlineMedium,
        );
      },
      selector: (_, counterData) => counterData.counter,
    );
  }
}
