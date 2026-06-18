import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/token_usecase.dart';
import 'auth_provider.dart';
import 'auth_state.dart';

class AuthNotifier extends AsyncNotifier<AuthState> {
  late final LoginUseCase _loginUseCase;
  late final GetTokenUseCase _getTokenUseCase;
  String? token;

  @override
  Future<AuthState> build() async {
    _loginUseCase = ref.read(loginUseCaseProvider);
    _getTokenUseCase = ref.read(tokenUseCaseProvider);

    final token = await _getTokenUseCase();

    return AuthState(token: token);
  }
  
  Future<void> login({
    required String username,
    required String password,
  }) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final user = await _loginUseCase(username: username, password: password);

      return AuthState(user: user, token: user.accessToken);
    });
  }
}
