import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_app/core/themes/app_colors.dart';
import 'package:riverpod_test_app/core/themes/app_text_styles.dart';

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
                  Container(
                    width: double.infinity,
                    height: 280,
                    color: AppColors.cardColor,
                    child: Image.network(product.thumbnail, fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      product.title,
                      style: AppTextStyles.titleXXBoldTextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Text(
                          "\$${product.price}",
                          style: AppTextStyles.greenBoldTextStyle,
                        ),

                        const Spacer(),

                        const Icon(Icons.star, color: AppColors.amber),

                        const SizedBox(width: 4),

                        Text(product.rating.toString()),
                      ],
                    ),
                  ),
                  Chip(label: Text(product.category)),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Description",
                          style: AppTextStyles.largeBoldTextStyle,
                        ),

                        const SizedBox(height: 10),

                        Text(
                          product.description,
                          style: AppTextStyles.mediumTextStyle,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Buy Now",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
