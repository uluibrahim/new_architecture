import 'package:flutter/material.dart';
import 'package:new_architecture/core/utils/network_status/network_status_manager.dart';
import 'package:provider/provider.dart';

import '../../core/view_model/view_model_factory.dart';
import '../../inject/dependency_injection.dart';
import 'app_provider.dart';

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
  void initState() {
    _setLocale();
    _networkStatusInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: getIt.get<ViewModelFactory>()),
        ValueListenableProvider.value(value: getIt.get<IAppProvider>()),
      ],
      child: widget.child,
    );
  }

  void _setLocale() {
    final IAppProvider localeProvider = getIt.get<IAppProvider>();
    localeProvider.init();
  }

  void _networkStatusInit() async {
    final INetworkStatusManager manager = getIt.get<INetworkStatusManager>();
    await manager.init();
  }
}
