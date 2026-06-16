// import '../models/product_list_response_model.dart';
//
// abstract class ProductsDatasource {
//   Future<ProductsListResponseModel> fetchProductList();
// }

import '../models/products_response_model.dart';

abstract class ProductsDataSource {
  Future<ProductsResponseModel> getProducts();
}
