import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router/app_router.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey = rootNavigatorKey;

  static BuildContext get context => navigatorKey.currentContext!;

  static void goToLogin() => context.go(RoutePaths.login);

  static void goToHome() => context.go(RoutePaths.productList);

  static void goToProductDetails(int productId) {
    context.push('/product-details/$productId');
  }

  static void pop() => context.pop();

  static bool canPop() => context.canPop();
}
