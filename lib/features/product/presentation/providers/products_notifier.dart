import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_app/features/product/presentation/providers/products_provider.dart';

import '../../domain/entities/products_entity.dart';

class ProductNotifier extends AsyncNotifier<List<ProductEntity>> {
  @override
  Future<List<ProductEntity>> build() async {
    return await ref.read(getProductsUseCaseProvider).call();
  }

  // late final ProductsUseCase _useCase;
  //
  // @override
  // Future<List<ProductEntity>> build() async {
  //   _useCase = ref.read(getProductsUseCaseProvider);
  //
  //   return await _useCase();
  // }
  //
  Future<void> refresh() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      return await ref.read(getProductsUseCaseProvider).call();
    });
  }
}
