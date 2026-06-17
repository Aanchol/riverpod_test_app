import '../entities/product_detail_entity.dart';
import '../entities/products_entity.dart';

abstract class ProductsRepository {
  Future<List<ProductEntity>> getProducts();

  Future<ProductDetailsEntity> getDetailsProducts(int id);
}
