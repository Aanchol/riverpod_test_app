import '../../data/models/login_request.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<User> login(LoginRequest request);

  Future<String?> getToken();
}
