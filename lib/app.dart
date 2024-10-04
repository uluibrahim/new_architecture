import 'package:flutter/material.dart';
import 'package:new_architecture/core/theme/dark_theme.dart';
import 'package:new_architecture/core/theme/ligth_theme.dart';
import 'package:new_architecture/product/route/custom_route_observer.dart';
import 'package:provider/provider.dart';
import 'product/models/app_model.dart';
import 'product/providers/global_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'product/route/app_router.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return GlobalProvider(
      child: Consumer<AppModel>(
        builder: (_, appModel, __) {
          return MaterialApp.router(
            routerConfig: _appRouter.config(
              navigatorObservers: () => [
                CustomRouteObserver(),
              ],
            ),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            locale: appModel.currentLanguage,
            title: 'Flutter Architecture',
            theme: LigthTheme.instance.themeData,
            darkTheme: DarkTheme.instance.themeData,
            themeMode: appModel.themeMode,
          );
        },
      ),
    );
  }
}
