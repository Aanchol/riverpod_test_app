import '../models/login_response_models.dart';

abstract class AuthRemoteDatasource {
  Future<LoginResponseModel> login({
    required String username,
    required String password,
  });
}