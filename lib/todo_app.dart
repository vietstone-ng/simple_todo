import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo/data/todos_local_storage.dart';
import 'package:simple_todo/domain/todos_service.dart';
import 'package:simple_todo/ui/home_page.dart';

// Configure layout, dependencies and servies for the app.
class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

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
