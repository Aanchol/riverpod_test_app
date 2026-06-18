//import '../../domain/entities/user.dart';
//
// class LoginResponseModel {
//   final int id;
//   final String username;
//   final String accessToken;
//
//   LoginResponseModel({
//     required this.id,
//     required this.username,
//     required this.accessToken,
//   });
//
//   factory LoginResponseModel.fromJson(
//       Map<String, dynamic> json,
//       ) {
//     return LoginResponseModel(
//       id: json['id'],
//       username: json['username'],
//       accessToken: json['accessToken'],
//     );
//   }
//
//   User toEntity() {
//     return User(
//       id: id,
//       username: username,
//       accessToken: accessToken,
//     );
//   }
// }

import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/user.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  final int id;
  final String username;
  final String accessToken;
  final String refreshToken;

  const LoginResponseModel({
    required this.id,
    required this.username,
    required this.accessToken,
    required this.refreshToken,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);

  User toEntity() {
    return User(
      id: id,
      username: username,
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}
