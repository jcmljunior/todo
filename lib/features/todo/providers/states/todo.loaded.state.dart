import 'package:todo/features/todo/providers/states/todo.state.dart';

class TodoLoaded extends TodoState {
  const TodoLoaded({
    required super.items,
    required super.subtasks,
  });
}
