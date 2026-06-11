import 'package:flutter_riverpod/legacy.dart';

import '../../domain/usecases/login_usecase.dart';
import 'auth_state.dart';

class AuthNotifier
    extends StateNotifier<AuthState> {

  final LoginUseCase loginUseCase;

  AuthNotifier(this.loginUseCase)
      : super(const AuthState());

  Future<void> login({
    required String username,
    required String password,
  }) async {

    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {

      final user = await loginUseCase(
        username: username,
        password: password,
      );

      state = state.copyWith(
        isLoading: false,
        user: user,
      );

    } catch (e) {

      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}

