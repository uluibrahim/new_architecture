import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@immutable
final class CustomRouteObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    // You can do something before push action.
    // For example you can send to analytics 
    super.didPush(route, previousRoute);
  }
}