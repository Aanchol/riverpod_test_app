import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_test_app/features/auth/presentation/screens/login_screen.dart';

import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/product/presentation/screens/product_details_screen.dart';
import '../../features/product/presentation/screens/product_list_screen.dart';

// Route paths
class RoutePaths {
  static const String home = '/';
  static const String login = '/login';
  static const String productList = '/product-list';
  static const String productDetails = '/product-details/:id';
}

// Global navigator keys
final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final appRouterProvider = Provider<GoRouter>((ref) {
  // Create router instance
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: RoutePaths.login,
    redirect: (context, state) {
      final authState = ref.watch(authProvider);

      final isLoggedIn = authState.value?.token != null;

      final isLoginRoute = state.matchedLocation == RoutePaths.login;

      if (!isLoggedIn && !isLoginRoute) {
        return RoutePaths.login;
      }

      if (isLoggedIn && isLoginRoute) {
        return RoutePaths.productList;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: RoutePaths.productList,
        builder: (context, state) => const ProductListScreen(),
      ),
      GoRoute(
        path: '/product-details/:id',
        builder: (context, state) {
          final productId = int.parse(state.pathParameters['id']!);

          return ProductDetailScreen(productId: productId);
        },
      ),
      GoRoute(
        path: RoutePaths.login,
        builder: (context, state) => LoginScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                'Page Not Found',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'The page "${state.matchedLocation}" could not be found.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    ),
  );
});
