import 'package:flutter/material.dart';
import 'package:todo/features/todo/models/todo.model.dart';

class TodoCheckboxWidget extends StatelessWidget {
  final TodoModel todo;

  const TodoCheckboxWidget({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: false,
      onChanged: (bool? value) {
        return debugPrint(todo.id.toString());
      },
    );
  }
}
