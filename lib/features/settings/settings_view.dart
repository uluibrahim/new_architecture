import 'package:flutter/material.dart';
import 'package:new_architecture/core/extensions/context_extension.dart';
import 'package:new_architecture/product/enum/languages.dart';
import 'package:new_architecture/product/models/app_model.dart';
import 'package:provider/provider.dart';

import '../../core/screen/screen.dart';
import 'settings_data.dart';
import 'settings_view_model.dart';

part 'settings_view_mixin.dart';

class SettingsScreen extends Screen {
  const SettingsScreen({super.key});

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState
    extends ScreenState<SettingsScreen, SettingsViewModel, SettingsData>
    with SettingsViewMixin {
  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _body,
    );
  }
}
