import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'dependency_injection.config.dart';

final getIt = GetIt.I;

@InjectableInit()
Future<void> initializeGetIt(String env) async => getIt.init(environment: env);

@module
abstract class RegisterModule {
 
}

class $RegisterModule extends RegisterModule {}
