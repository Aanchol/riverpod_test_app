import '../models/login_request.dart';
import '../models/login_response_model.dart';

abstract class AuthRemoteDatasource {
  Future<LoginResponseModel> login(LoginRequest request);
}
