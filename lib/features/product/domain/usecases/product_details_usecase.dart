import 'package:riverpod_test_app/features/product/domain/entities/product_detail_entity.dart';

import '../repositories/products_repository.dart';

class ProductsDetailsUseCase {
  final ProductsRepository repository;

  ProductsDetailsUseCase(this.repository);

  Future<ProductDetailsEntity> call(int id) {
    return repository.getDetailsProducts(id);
  }
}
