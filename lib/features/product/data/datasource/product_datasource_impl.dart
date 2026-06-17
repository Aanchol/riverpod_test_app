import 'package:riverpod_test_app/features/product/data/datasource/product_datasource.dart';

import '../models/product_model.dart';
import '../models/products_response_model.dart';
import 'products_api_service.dart';

class ProductsDataSourceImpl implements ProductsDataSource {
  final ProductsApiService apiService;

  ProductsDataSourceImpl(this.apiService);

  @override
  Future<ProductsResponseModel> getProducts() {
    return apiService.getProducts();
  }

  @override
  Future<ProductModel> getProductDetails(int id) {
    return apiService.getProductDetails(id);
  }
}
