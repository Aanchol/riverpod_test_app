import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/products_provider.dart';
import '../widgets/product_card_widget.dart';

class ProductListScreen extends ConsumerStatefulWidget {
  const ProductListScreen({super.key});

  @override
  ConsumerState<ProductListScreen> createState() =>
      _ProductListScreenState();
}

class _ProductListScreenState
    extends ConsumerState<ProductListScreen> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(productListProvider.notifier).getProductList();
    });
  }

  @override
  Widget build(BuildContext context) {

    final state = ref.watch(productListProvider);
    if (state.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    if (state.error != null) {
      print(state.error);
      return Scaffold(
        body: Center(
          child: Text(state.error!),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: state.products?.productsList.length,
        itemBuilder: (context, index) {
          final product = state.products?.productsList ?? [];

          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: ProductCard(thumbnail: product[index].thumbnail??"",
            title: product[index].title??"",
              description: product[index].description??"",
              category: product[index].category,
              price: product[index].price,
              discountPercentage: product[index].discountPercentage,
              rating: product[index].rating,
              stock: product[index].stock,
              tags: product[index].tags,
              brand: product[index].brand,
            ),
          );
        },
      ),
    );
  }
}