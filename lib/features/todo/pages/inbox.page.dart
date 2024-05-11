import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        floatingActionButton: ValueListenableBuilder<TodoState>(
          valueListenable: context.read<TodoStore>(),
          builder: (BuildContext context, TodoState todo, _) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 8.0),
                FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.remove),
                ),
              ],
            );
          },
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
