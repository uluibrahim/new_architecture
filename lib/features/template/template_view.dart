import 'package:flutter/material.dart';

import '../../core/screen/screen.dart';
import 'template_data.dart';
import 'template_view_model.dart';

part 'template_view_mixin.dart';

class TemplateScreen extends Screen {
  const TemplateScreen({super.key});

  @override
  TemplateScreenState createState() => TemplateScreenState();
}

class TemplateScreenState
    extends ScreenState<TemplateScreen, TemplateViewModel, TemplateData>
    with TemplateViewMixin {
  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: _body,
    );
  }
}
