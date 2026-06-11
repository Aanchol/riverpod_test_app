import 'package:dio/dio.dart';
import 'package:riverpod_test_app/features/product/data/datasource/product_datasource.dart';

import '../models/product_list_response_model.dart';

class ProductsDatasourceImpl
    implements ProductsDatasource {

  final Dio dio;

  ProductsDatasourceImpl(this.dio);

  @override
  Future<ProductsListResponseModel> fetchProductList() async {

    final response = await dio.get(
      'https://dummyjson.com/products',
    );

    return ProductsListResponseModel.fromJson(
      response.data,
    );
  }
}