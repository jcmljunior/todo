import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/features/todo/models/todo.model.dart';
import 'package:todo/features/todo/providers/states/todo.error.state.dart';
import 'package:todo/features/todo/providers/states/todo.loaded.state.dart';
import 'package:todo/features/todo/providers/states/todo.loading.state.dart';
import 'package:todo/features/todo/providers/states/todo.state.dart';
import 'package:todo/features/todo/providers/stores/todo.store.dart';
import 'package:todo/features/todo/widgets/todo.item.widget.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    final todoStore = context.watch<TodoStore>();

    if (todoStore.value is TodoLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (todoStore.value is TodoError) {
      return Center(
        child: Text("${todoStore.value}"),
      );
    }

    if (todoStore.value is TodoLoaded) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            todoStore.addTodo(
              TodoModel(
                id: 3,
                userId: 1,
                title: "Todo 3",
                content: "Todo 3 content",
                isFavorite: false,
                isCompleted: false,
                createdAt: DateTime.now(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
        body: ValueListenableBuilder<TodoState>(
          valueListenable: context.read<TodoStore>(),
          builder: (BuildContext context, TodoState todo, __) {
            return ListView.builder(
              itemCount: todoStore.value.items.length,
              itemBuilder: (BuildContext context, int index) {
                return TodoItemWidget(todo: todo.items[index]);
              },
            );
          },
        ),
      );
    }

    return Container();
  }
}
