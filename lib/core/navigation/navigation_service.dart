import 'package:flutter/material.dart';

import '../router/app_router.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey = rootNavigatorKey;

  static BuildContext get context => navigatorKey.currentContext!;

  static void goToLogin() => appRouter.go(RoutePaths.login);

  static void goToSplash() => appRouter.go(RoutePaths.home);

  static void goToProductDetails(int productId) {
    appRouter.push('/product-details/$productId');
  }

  static void pop() => appRouter.pop();

  static bool canPop() => appRouter.canPop();
}
