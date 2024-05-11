import 'package:flutter/material.dart'
    show BuildContext, StatelessWidget, Widget;
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:todo/features/todo/providers/stores/todo.store.dart';
import 'package:todo/features/todo/services/todo.service.dart';
import 'package:todo/shared/app/widgets/app.widget.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => Dio(),
        ),
        Provider(
          create: (BuildContext context) => TodoService(context.read()),
        ),
        // ChangeNotifierProvider(create: (context) => storage),
        ChangeNotifierProvider(
          create: (BuildContext context) => TodoStore(context.read()),
        ),
      ],
      child: const AppWidget(),
    );
  }
}
