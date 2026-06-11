


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_test_app/features/product/presentation/providers/products_notifier.dart';
import 'package:riverpod_test_app/features/product/presentation/providers/products_state.dart';

import '../../../../core/network/dio_provider.dart';
import '../../data/datasource/product_datasource.dart';
import '../../data/datasource/product_datasource_impl.dart';
import '../../data/repositories/products_repository_impl.dart';
import '../../domain/repositories/products_repository.dart';
import '../../domain/usecases/products_usecase.dart';

final productsRemoteDatasourceProvider = Provider<ProductsDatasource>((ref) {
  return ProductsDatasourceImpl(ref.read(dioProvider));
});

final productsRepositoryProvider = Provider<ProductsRepository>((ref) {
  return ProductsRepositoryImpl(ref.read(productsRemoteDatasourceProvider));
});

final productUseCaseProvider = Provider<ProductsUseCase>((ref) {
  return ProductsUseCase(ref.read(productsRepositoryProvider));
});

final productListProvider = StateNotifierProvider<ProductsNotifier, ProductsState>((ref) {
  return ProductsNotifier(ref.read(productUseCaseProvider));
});
