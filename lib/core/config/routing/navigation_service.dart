import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  ///Push
  Future<T?> push<T extends Object?>(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    return context.push(routeName, extra: arguments);
  }

  /// Push to a named route with optional arguments
  Future<T?> pushNamed<T extends Object?>(
    BuildContext context,
    String routeName, {
    Object? arguments,
    Widget? backButton,
  }) {
    return context.pushNamed(routeName, extra: arguments);
  }

  /// Replace current route with a named route
  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return navigatorKey.currentState!.pushReplacementNamed(
      routeName,
      arguments: arguments,
      result: result,
    );
  }

  /// Go back
  void pop<T extends Object?>([T? result]) {
    navigatorKey.currentState!.pop(result);
  }
}
