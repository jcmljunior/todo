import 'package:equatable/equatable.dart';
import 'package:todo/shared/todo/models/todo.model.dart';

abstract class TodoState extends Equatable {
  final List<TodoModel> items;

  const TodoState({
    required this.items,
  });

  @override
  List<Object> get props => [items];
}

class TodoInitial extends TodoState {
  TodoInitial() : super(items: []);
}

class TodoLoading extends TodoState {
  TodoLoading() : super(items: []);
}

class TodoLoaded extends TodoState {
  const TodoLoaded({
    required super.items,
  });
}

class TodoError extends TodoState {
  final String message;

  TodoError({
    required this.message,
  }) : super(items: []);
}
