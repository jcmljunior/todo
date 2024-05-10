import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/features/todo/providers/states/todo.error.state.dart';
import 'package:todo/features/todo/providers/states/todo.loaded.state.dart';
import 'package:todo/features/todo/providers/states/todo.loading.state.dart';
import 'package:todo/features/todo/providers/stores/todo.store.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({super.key});

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  @override
  void initState() {
    super.initState();

    // TODO: Add persistent frame callback
    WidgetsBinding.instance.addPersistentFrameCallback((_) {
      context.read<TodoStore>().getTodos();
    });
  }

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
        body: ListView.builder(
          itemCount: todoStore.value.items.length,
          itemBuilder: (BuildContext context, int index) {
            return Text(todoStore.value.items[index].title);
          },
        ),
      );
    }

    return Container();
  }
}
