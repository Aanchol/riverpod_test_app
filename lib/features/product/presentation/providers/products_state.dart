

import 'package:riverpod_test_app/features/product/domain/entities/products_entity.dart';

class ProductsState {
  final bool isLoading;
  final ProductsEntity? products;
  final String? error;

  const ProductsState({
    this.isLoading = false,
    this.products,
    this.error,
  });

  ProductsState copyWith({
    bool? isLoading,
    ProductsEntity? products,
    String? error,
  }) {
    return ProductsState(
      isLoading: isLoading ?? this.isLoading,
      products: products ?? this.products,
      error: error,
    );
  }
}