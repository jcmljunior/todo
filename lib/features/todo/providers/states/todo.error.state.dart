import 'package:todo/features/todo/providers/states/todo.state.dart';

class TodoError extends TodoState {
  final String message;

  TodoError({
    required this.message,
  }) : super(items: [], subtasks: []);
}
