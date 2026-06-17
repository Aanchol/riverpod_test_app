import '../models/product_model.dart';
import '../models/products_response_model.dart';

abstract class ProductsDataSource {
  Future<ProductsResponseModel> getProducts();

  Future<ProductModel> getProductDetails(int id);
}
