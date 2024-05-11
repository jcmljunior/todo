import 'dart:io';
import 'package:dio/dio.dart';
import 'package:todo/shared/app/constants/app.constants.dart';
import 'package:todo/shared/todo/models/todo.model.dart';

class TodoService {
  final Dio _client;

  TodoService(this._client);

  Future<List<TodoModel>> getTodos() async {
    final Response<dynamic> response =
        await _client.get("$baseUrl$pathForTodos",
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
