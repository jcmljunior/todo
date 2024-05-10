import 'dart:io';
import 'package:dio/dio.dart';
import 'package:todo/features/todo/models/todo.model.dart';

class TodoService {
  final Dio client;
  final url = "http://192.168.169.28:3000/todos";

  TodoService(this.client);

  Future<List<TodoModel>> getTodos() async {
    final Response<dynamic> response = await client.get(url,
        options: Options(
          contentType: ContentType.json.toString(),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ));
    await Future.delayed(const Duration(seconds: 1));
    final List<TodoModel> todos = List.from(response.data)
        .map((e) => TodoModel.fromMap(e as Map<String, dynamic>))
        .toList();

    return todos;
  }
}
