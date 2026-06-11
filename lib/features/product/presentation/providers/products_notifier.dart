import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_test_app/features/product/presentation/providers/products_state.dart';

import '../../domain/usecases/products_usecase.dart';

class ProductsNotifier
    extends StateNotifier<ProductsState> {

  final ProductsUseCase productsUseCase;

  ProductsNotifier(this.productsUseCase)
      : super(const ProductsState());

  Future<void> getProductList() async {

    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {

      final products = await productsUseCase.callProductList();

      state = state.copyWith(
        isLoading: false,
        products: products,
      );

    } catch (e) {

      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}

