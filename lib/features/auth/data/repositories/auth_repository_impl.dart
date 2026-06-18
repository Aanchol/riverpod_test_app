import 'package:riverpod_test_app/features/auth/data/datasource/auth_local_datasource.dart';
import 'package:riverpod_test_app/features/auth/data/models/login_request.dart';

import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasource/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDatasource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl(this.remoteDatasource, this.localDataSource);

  @override
  Future<User> login(LoginRequest request) async {
    final response = await remoteDatasource.login(request);
    print("Access Token: ${response.accessToken}");
    final token = response.accessToken;
    await localDataSource.saveToken(token);
    return response.toEntity();
  }

  @override
  Future<String?> getToken() {
    print("Get Token: ${localDataSource.getToken()}");
    return localDataSource.getToken();
  }
}
