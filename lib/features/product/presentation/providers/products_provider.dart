import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_app/features/product/presentation/providers/products_notifier.dart';

import '../../../../core/di/injection_container.dart';
import '../../domain/entities/products_entity.dart';
import '../../domain/usecases/products_usecase.dart';

final getProductsUseCaseProvider = Provider<ProductsUseCase>((ref) {
  return getIt<ProductsUseCase>();
});

final productProvider =
    AsyncNotifierProvider<ProductNotifier, List<ProductEntity>>(
      ProductNotifier.new,
    );
