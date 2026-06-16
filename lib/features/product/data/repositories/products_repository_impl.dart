// class ProductsRepositoryImpl
//     implements ProductsRepository {
//
//   final ProductsDatasource datasource;
//
//   ProductsRepositoryImpl(this.datasource);
//
//   @override
//   Future<ProductsEntity> fetchProductList() async {
//
//     final model = await datasource.fetchProductList();
//
//     return model.toEntity();
//   }
// }

import '../../domain/entities/products_entity.dart';
import '../../domain/repositories/products_repository.dart';
import '../datasource/product_datasource.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsDataSource dataSource;

  ProductsRepositoryImpl(this.dataSource);

  @override
  Future<List<ProductEntity>> getProducts() async {
    final response = await dataSource.getProducts();

    return response.products
        .map(
          (e) => ProductEntity(
            //id: e.id,
            title: e.title,
            description: e.description,
            category: e.category,
            price: e.price,
            rating: e.rating,
            thumbnail: e.thumbnail,
          ),
        )
        .toList();
  }
}
