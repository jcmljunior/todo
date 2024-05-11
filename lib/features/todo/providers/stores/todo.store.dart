import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:todo/features/todo/providers/states/todo.state.dart';
import 'package:todo/features/todo/services/todo.service.dart';
import 'package:todo/shared/todo/models/todo.model.dart';

class TodoStore extends ValueNotifier<TodoState> {
  final TodoService _service;

  TodoStore(this._service) : super(TodoInitial());

  Future<void> getTodos() async {
    value = TodoLoading();
    try {
      final List<TodoModel> todos = await _service.getTodos();
      value = TodoLoaded(
        items: todos,
      );
    } catch (e) {
      value = TodoError(message: e.toString());
    }
  }

  void addTodo(TodoModel todo) {
    value = TodoLoaded(
      items: [...value.items, todo],
    );
  }
}
