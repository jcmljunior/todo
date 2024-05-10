import 'dart:io';
import 'package:dio/dio.dart';
import 'package:todo/features/todo/models/todo.model.dart';
import 'package:todo/shared/services/common.service.dart';

class TodoService extends CommonService {
  TodoService(super.client);

  Future<List<TodoModel>> getTodos() async {
    final Response<dynamic> response =
        await client.get("${uri.toString()}todos",
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
