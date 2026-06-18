import 'package:riverpod_test_app/features/auth/data/datasource/auth_api_service.dart';
import 'package:riverpod_test_app/features/auth/data/models/login_request.dart';

import '../datasource/auth_remote_datasource.dart';
import '../models/login_response_model.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final AuthApiService authApiService;

  AuthRemoteDatasourceImpl(this.authApiService);

  @override
  Future<LoginResponseModel> login(LoginRequest request) {
    return authApiService.login(request);
  }
}
