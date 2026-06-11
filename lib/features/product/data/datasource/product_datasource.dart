import '../models/product_list_response_model.dart';

abstract class ProductsDatasource {
  Future<ProductsListResponseModel> fetchProductList();
}