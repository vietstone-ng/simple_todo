import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo/data/todos_local_storage.dart';
import 'package:simple_todo/domain/todos_service.dart';
import 'package:simple_todo/ui/home_page.dart';

// Configure servies for the app.
class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<TodosService>(
      create: (_) => TodosService(storage: TodosLocalStorage()),
      dispose: (_, service) => service.dispose(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
