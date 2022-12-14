// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive_flutter/adapters.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final String username;
  @HiveField(1)
  final String id;
  @HiveField(2)
  final String password;

  const UserModel(
      {required this.password, required this.id, required this.username});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'id': id,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] as String,
      id: map['id'] as String,
      password: map['password'] as String,
    );
  }
}
