import 'package:go_router/go_router.dart';

import '../../features/product/presentation/screens/product_list_screen.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: '/products',
    routes: [
      GoRoute(
        path: '/products',
        name: 'products',
        builder: (context, state) {
          return const ProductListScreen();
        },
      ),
    ],
  );
}
