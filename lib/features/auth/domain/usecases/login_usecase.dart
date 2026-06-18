import '../../data/models/login_request.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<User> call({
    required String username,
    required String password,
  }) async {
    final request = LoginRequest(username: username, password: password);

    return await repository.login(request);
  }
}
