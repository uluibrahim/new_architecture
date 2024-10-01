import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:new_architecture/core/extensions/context_extension.dart';
import 'package:new_architecture/product/utils/assets/asset_constant.dart';
import 'package:provider/provider.dart';

import '../../core/screen/screen.dart';
import 'counter_data.dart';
import 'counter_view_model.dart';

part 'counter_view_mixin.dart';

@RoutePage()
class CounterScreen extends Screen {
  const CounterScreen({super.key});

  @override
  CounterScreenState createState() => CounterScreenState();
}

class CounterScreenState
    extends ScreenState<CounterScreen, CounterViewModel, CounterData>
    with CounterViewMixin {
  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _body,
      floatingActionButton: _floatingButtons,
    );
  }
}
