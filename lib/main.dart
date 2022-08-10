import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_todo/constants.dart';
import 'package:simple_todo/models/task.adapter.dart';
import 'package:simple_todo/todo_app.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox(kHiveTodosBoxName);

  runApp(const TodoApp());
}
