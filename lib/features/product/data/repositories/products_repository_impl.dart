import 'package:riverpod_test_app/features/product/domain/entities/products_entity.dart';

import '../../domain/repositories/products_repository.dart';
import '../datasource/product_datasource.dart';

class ProductsRepositoryImpl
    implements ProductsRepository {

  final ProductsDatasource datasource;

  ProductsRepositoryImpl(this.datasource);

  @override
  Future<ProductsEntity> fetchProductList() async {

    final model = await datasource.fetchProductList();

    return model.toEntity();
  }
}