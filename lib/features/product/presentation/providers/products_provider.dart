import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_app/features/product/presentation/providers/products_notifier.dart';

import '../../../../core/di/injection_container.dart';
import '../../domain/entities/product_detail_entity.dart';
import '../../domain/entities/products_entity.dart';
import '../../domain/usecases/product_details_usecase.dart';
import '../../domain/usecases/products_usecase.dart';

final getProductsUseCaseProvider = Provider<ProductsUseCase>((ref) {
  return getIt<ProductsUseCase>();
});

final getProductDetailsUseCaseProvider = Provider<ProductsDetailsUseCase>((
  ref,
) {
  return getIt<ProductsDetailsUseCase>();
});

final productProvider =
    AsyncNotifierProvider<ProductNotifier, List<ProductEntity>>(
      ProductNotifier.new,
    );

final productDetailsProvider = FutureProvider.family<ProductDetailsEntity, int>(
  (ref, productId) {
    return ref.read(getProductDetailsUseCaseProvider).call(productId);
  },
);
