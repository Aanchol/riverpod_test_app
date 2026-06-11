import '../entities/products_entity.dart';

abstract class ProductsRepository {
  Future<ProductsEntity> fetchProductList();
}