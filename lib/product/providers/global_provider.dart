import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/view_model/view_model_factory.dart';
import '../../inject/dependency_injection.dart';

class GlobalProvider extends StatefulWidget {
  const GlobalProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<GlobalProvider> createState() => _GlobalProviderState();
}

class _GlobalProviderState extends State<GlobalProvider> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: getIt.get<ViewModelFactory>()),
      ],
      child: widget.child,
    );
  }
}
