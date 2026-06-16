

// final authRemoteDatasourceProvider = Provider<AuthRemoteDatasource>((ref) {
//   return AuthRemoteDatasourceImpl(ref.read(dioProvider));
// });
//
// final authRepositoryProvider = Provider<AuthRepository>((ref) {
//   return AuthRepositoryImpl(ref.read(authRemoteDatasourceProvider));
// });
//
// final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
//   return LoginUseCase(ref.read(authRepositoryProvider));
// });
//
// final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
//   return AuthNotifier(ref.read(loginUseCaseProvider));
// });
