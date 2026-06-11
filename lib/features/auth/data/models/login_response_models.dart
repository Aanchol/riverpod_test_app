import '../../domain/entities/user.dart';

class LoginResponseModel {
  final int id;
  final String username;
  final String accessToken;

  LoginResponseModel({
    required this.id,
    required this.username,
    required this.accessToken,
  });

  factory LoginResponseModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return LoginResponseModel(
      id: json['id'],
      username: json['username'],
      accessToken: json['accessToken'],
    );
  }

  User toEntity() {
    return User(
      id: id,
      username: username,
      accessToken: accessToken,
    );
  }
}