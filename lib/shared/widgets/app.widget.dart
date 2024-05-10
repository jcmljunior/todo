import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/features/todo/pages/inbox.page.dart';
import 'package:todo/features/todo/providers/stores/todo.store.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        brightness: Brightness.dark,
        fontFamily: "Satoshi",
      ),
      initialRoute: "/",
      routes: {
        "/": (context) {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            await Future.wait([
              context.read<TodoStore>().getTodos(),
            ]);
          });

          // WidgetsBinding.instance.addPersistentFrameCallback((_) async {
          //   Future.wait([
          //     context.read<TodoStore>().getTodos(),
          //   ]);
          // });

          return const InboxPage();
        },
      },
    );
  }
}
