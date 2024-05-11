import 'dart:developer';
import 'package:flutter/material.dart'
    show Checkbox, BuildContext, Widget, StatelessWidget;
import 'package:todo/shared/todo/models/todo.model.dart';

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
        inspect(todo);
      },
    );
  }
}
