import 'package:riverpod_test_app/features/product/data/datasource/product_datasource.dart';

// class ProductsDatasourceImpl implements ProductsDatasource {
//   //final Dio dio;
//   final ApiService api;
//
//   ProductsDatasourceImpl(this.api);
//
//   @override
//   Future<ProductsListResponseModel> fetchProductList() async {
//     return api.getProducts();
//   }
// }

import '../models/products_response_model.dart';
import 'products_api_service.dart';

class ProductsDataSourceImpl implements ProductsDataSource {
  final ProductsApiService apiService;

  ProductsDataSourceImpl(this.apiService);

  @override
  Future<ProductsResponseModel> getProducts() {
    return apiService.getProducts();
  }
}
