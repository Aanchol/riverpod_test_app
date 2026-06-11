import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasource/auth_remote_datasource.dart';

class AuthRepositoryImpl
    implements AuthRepository {

  final AuthRemoteDatasource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<User> login({
    required String username,
    required String password,
  }) async {

    final model = await datasource.login(
      username: username,
      password: password,
    );

    return model.toEntity();
  }
}