import '../entities/products_entity.dart';
import '../repositories/products_repository.dart';

class ProductsUseCase {
  final ProductsRepository repository;

  ProductsUseCase(this.repository);

  Future<List<ProductEntity>> call() {
    return repository.getProducts();
  }
}
