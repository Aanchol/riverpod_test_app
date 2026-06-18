import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_app/features/auth/domain/usecases/token_usecase.dart';

import '../../../../core/di/injection_container.dart';
import '../../domain/usecases/login_usecase.dart';
import 'auth_notifier.dart';
import 'auth_state.dart';

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  return getIt<LoginUseCase>();
});
final tokenUseCaseProvider = Provider<GetTokenUseCase>((ref) {
  return getIt<GetTokenUseCase>();
});

final authProvider = AsyncNotifierProvider<AuthNotifier, AuthState>(
  AuthNotifier.new,
);
