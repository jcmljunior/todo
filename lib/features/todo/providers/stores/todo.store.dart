import 'package:flutter/foundation.dart';
import 'package:todo/features/todo/models/todo.model.dart';
import 'package:todo/features/todo/providers/states/todo.error.state.dart';
import 'package:todo/features/todo/providers/states/todo.initial.state.dart';
import 'package:todo/features/todo/providers/states/todo.loaded.state.dart';
import 'package:todo/features/todo/providers/states/todo.loading.state.dart';
import 'package:todo/features/todo/providers/states/todo.state.dart';
import 'package:todo/features/todo/services/todo.service.dart';

class TodoStore extends ValueNotifier<TodoState> {
  final TodoService _service;

  TodoStore(this._service) : super(TodoInitial());

  Future<void> getTodos() async {
    value = TodoLoading();
    try {
      final List<TodoModel> todos = await _service.getTodos();
      value = TodoLoaded(
        items: todos,
        subtasks: const [],
      );
    } catch (e) {
      value = TodoError(message: e.toString());
    }
  }

  void addTodo(TodoModel todo) {
    value = TodoLoaded(
      items: [...value.items, todo],
      subtasks: value.subtasks,
    );
  }
}
