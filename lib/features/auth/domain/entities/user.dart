class User {
  final int id;
  final String username;
  final String accessToken;
  final String refreshToken;

  User({
    required this.id,
    required this.username,
    required this.accessToken,
    required this.refreshToken,
  });
}
