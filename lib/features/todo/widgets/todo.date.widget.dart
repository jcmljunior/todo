import 'package:flutter/widgets.dart'
    show Text, TextStyle, BuildContext, Widget, StatelessWidget;
import 'package:todo/shared/todo/models/todo.model.dart';

class TodoDateWidget extends StatelessWidget {
  final TodoModel todo;

  const TodoDateWidget({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      todo.createdAt.toString(),
      style: const TextStyle(
        fontSize: 14,
      ),
    );
  }
}
