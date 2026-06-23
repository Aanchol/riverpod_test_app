import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_app/core/widgets/custom_app_bar.dart';

import '../../../../core/router/navigation_service.dart';
import '../providers/products_provider.dart';

class ProductListScreen extends ConsumerWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productProvider);

    return Scaffold(
      appBar: CustomAppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(productProvider.notifier).refresh();
        },
        child: productState.when(
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
          error: (error, stackTrace) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(error.toString(), textAlign: TextAlign.center),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      ref.invalidate(productProvider);
                    },
                    child: const Text("Retry"),
                  ),
                ],
              ),
            );
          },
          data: (products) {
            return ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];

                return InkWell(
                  onTap: () {
                    NavigationService.goToProductDetails(product.id);
                  },
                  child: ListTile(
                    leading: Image.network(
                      product.thumbnail,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(product.title),
                    subtitle: Text(product.category),
                    trailing: Text("\$${product.price}"),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
