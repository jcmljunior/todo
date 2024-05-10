import 'package:equatable/equatable.dart';
import 'package:todo/features/todo/models/subtask.model.dart';
import 'package:todo/features/todo/models/todo.model.dart';

abstract class TodoState extends Equatable {
  final List<TodoModel> items;
  final List<SubtaskModel> subtasks;

  const TodoState({
    required this.items,
    required this.subtasks,
  });

  @override
  List<Object> get props => [items];
}
