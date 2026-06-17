import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/product_model.dart';
import '../models/products_response_model.dart';

part 'products_api_service.g.dart';

@RestApi()
abstract class ProductsApiService {
  factory ProductsApiService(Dio dio, {String baseUrl}) = _ProductsApiService;

  @GET("/products")
  Future<ProductsResponseModel> getProducts();

  @GET("/products/{id}")
  Future<ProductModel> getProductDetails(@Path("id") int id);
}
