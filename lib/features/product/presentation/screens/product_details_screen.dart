import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/navigation/navigation_service.dart';
import '../providers/products_provider.dart';

class ProductDetailScreen extends ConsumerWidget {
  final int productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(productDetailsProvider(productId));

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            NavigationService.pop();
          },
          child: Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text("Product Detail"),
      ),
      body: detailState.when(
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (e, s) => Center(child: Text(e.toString())),

        data: (product) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Image.network(product.thumbnail),
                  Text(product.title),
                  Text(product.description),
                  Text("\$${product.price}"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
