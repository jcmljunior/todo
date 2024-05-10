import 'package:flutter/material.dart';
import 'package:todo/features/todo/models/todo.model.dart';

class TodoTitleWidget extends StatelessWidget {
  final TodoModel todo;

  const TodoTitleWidget({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            todo.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            todo.content,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
