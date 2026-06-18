import '../../domain/entities/user.dart';

class AuthState {
  final User? user;
  final String? token;

  const AuthState({this.user, this.token});

  bool get isLoggedIn => token != null && token!.isNotEmpty;
}
