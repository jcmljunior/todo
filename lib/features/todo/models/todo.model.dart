import 'dart:convert';
import 'package:equatable/equatable.dart';

class TodoModel extends Equatable {
  final int id;
  final int userId;
  final String title;
  final String content;
  final bool isFavorite;
  final bool isCompleted;
  final DateTime createdAt;

  const TodoModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.content,
    required this.isFavorite,
    required this.isCompleted,
    required this.createdAt,
  });

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      title,
      content,
      isFavorite,
      isCompleted,
      createdAt,
    ];
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: int.parse(map['id'].toString()),
      userId: int.parse(map['userId'].toString()),
      title: map['title'].toString(),
      content: map['content'].toString(),
      isFavorite: bool.parse(map['isFavorite'].toString()),
      isCompleted: bool.parse(map['isCompleted'].toString()),
      createdAt: DateTime.parse(map['createdAt'].toString()),
    );
  }

  factory TodoModel.fromJson(String source) {
    return TodoModel.fromMap(
      json.decode(source) as Map<String, dynamic>,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'content': content,
      'isFavorite': isFavorite,
      'isCompleted': isCompleted,
      'createdAt': createdAt,
    };
  }

  String toJson() {
    return json.encode(toMap());
  }

  @override
  String toString() {
    return 'TodoModel(id: $id, userId: $userId, title: $title, content: $content, isFavorite: $isFavorite, isCompleted: $isCompleted, createdAt: $createdAt)';
  }
}
