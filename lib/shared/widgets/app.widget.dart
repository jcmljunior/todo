import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:todo/features/profiles/providers/stores/profile.store.dart';
import 'package:todo/features/profiles/services/profile.service.dart';
import 'package:todo/features/todo/pages/inbox.page.dart';
import 'package:todo/features/todo/providers/stores/todo.store.dart';
import 'package:todo/features/todo/services/todo.service.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => Dio()),
        Provider(create: (context) => ProfileService(context.read())),
        Provider(create: (context) => TodoService(context.read())),
        ChangeNotifierProvider(
            create: (context) => ProfileStore(context.read())),
        ChangeNotifierProvider(create: (context) => TodoStore(context.read())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
          brightness: Brightness.dark,
          fontFamily: "Satoshi",
        ),
        home: const InboxPage(),
      ),
    );
  }
}
