import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_test_app/features/auth/data/models/login_response_model.dart';

import '../models/login_request.dart';

part 'auth_api_service.g.dart';

@RestApi()
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST("/auth/login")
  Future<LoginResponseModel> login(@Body() LoginRequest request);
}
