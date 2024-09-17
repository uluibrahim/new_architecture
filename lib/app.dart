import 'package:flutter/material.dart';
import 'package:new_architecture/main.dart';
import 'package:new_architecture/product/providers/global_provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalProvider(
      child: MaterialApp(
        title: 'Flutter Architecture',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
