import 'dart:convert';
import 'package:equatable/equatable.dart';

class ProfileModel extends Equatable {
  final int? id;
  final String name;
  final String? username;
  final String? email;
  final String? password;

  const ProfileModel({
    this.id,
    required this.name,
    this.username,
    this.email,
    this.password,
  });

  @override
  List<Object?> get props => [id, name, username, email, password];

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: int.parse(map['id'].toString()),
      name: map['name'].toString(),
      username: map['username'].toString(),
      email: map['email'].toString(),
      password: map['password'].toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    };
  }

  factory ProfileModel.fromJson(String source) =>
      ProfileModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'SubtaskModel(id: $id, name: $name, username: $username, email: $email, password: $password)';
  }
}
