import 'package:auto_route/auto_route.dart';

import '../../features/counter/counter_view.dart';
import '../../features/settings/settings_view.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: CounterRoute.page, initial: true),
        AutoRoute(page: SettingsRoute.page),
      ];
}
