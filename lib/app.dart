import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/counter/counter_view.dart';
import 'product/models/app_model.dart';
import 'product/providers/global_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalProvider(
      child: Consumer<AppModel>(
        builder: (_, appModel, __) {
          return MaterialApp(
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            locale: appModel.currentLanguage,
            title: 'Flutter Architecture',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const CounterScreen(),
          );
        },
      ),
    );
  }
}
