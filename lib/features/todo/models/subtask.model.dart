import 'dart:convert';
import 'package:equatable/equatable.dart';

class SubtaskModel extends Equatable {
  final int id;
  final int userId;
  final String title;
  final String content;

  const SubtaskModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.content,
  });

  @override
  List<Object?> get props => [id, userId, title, content];

  factory SubtaskModel.fromMap(Map<String, dynamic> map) {
    return SubtaskModel(
      id: int.parse(map['id']),
      userId: int.parse(map['userId']),
      title: map['title'],
      content: map['content'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'content': content,
    };
  }

  factory SubtaskModel.fromJson(String source) =>
      SubtaskModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'SubtaskModel(id: $id, userId: $userId, title: $title, content: $content)';
  }
}
