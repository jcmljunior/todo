import 'package:flutter/widgets.dart'
    show
        Row,
        Column,
        Padding,
        CrossAxisAlignment,
        EdgeInsets,
        BuildContext,
        Widget,
        StatelessWidget;
import 'package:todo/features/todo/widgets/todo.checkbox.widget.dart';
import 'package:todo/features/todo/widgets/todo.date.widget.dart';
import 'package:todo/features/todo/widgets/todo.title.widget.dart';
import 'package:todo/shared/todo/models/todo.model.dart';

class TodoItemWidget extends StatelessWidget {
  final TodoModel todo;

  const TodoItemWidget({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TodoCheckboxWidget(todo: todo),
              TodoTitleWidget(todo: todo),
              TodoDateWidget(todo: todo),
            ],
          ),
        ],
      ),
    );
  }
}
