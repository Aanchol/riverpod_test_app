import 'package:dio/dio.dart';

import '../datasource/auth_remote_datasource.dart';
import '../models/login_response_models.dart';

class AuthRemoteDatasourceImpl
    implements AuthRemoteDatasource {

  final Dio dio;

  AuthRemoteDatasourceImpl(this.dio);

  @override
  Future<LoginResponseModel> login({
    required String username,
    required String password,
  }) async {

    final response = await dio.post(
      'https://dummyjson.com/auth/login',
      data: {
        'username': username,
        'password': password,
      },
    );

    return LoginResponseModel.fromJson(
      response.data,
    );
  }
}