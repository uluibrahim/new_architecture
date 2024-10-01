part of 'counter_view.dart';

// Write here view's widgets and functions
mixin CounterViewMixin
    on ScreenState<CounterScreen, CounterViewModel, CounterData> {
  PreferredSizeWidget get _appBar => AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(context.locale.counterPage),
      );

  Widget get _body => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(context.locale.counterContent),
            _counterText,
            _counterImage
          ],
        ),
      );

  get _incrementCounterButton => FloatingActionButton(
        heroTag: "Increment",
        onPressed: viewModel.incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      );

  get _settingsButton => FloatingActionButton(
        heroTag: "settings",
        onPressed: () {
          viewModel.goToSettingsPage(context);
        },
        tooltip: 'settings',
        child: const Icon(Icons.settings),
      );

  get _floatingButtons => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _incrementCounterButton,
          const SizedBox(width: 20),
          _settingsButton,
        ],
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

  Widget get _counterImage {
    return Image.asset(
      AssetConstant.images.counter,
      width: 100,
      height: 100,
    );
  }
}
