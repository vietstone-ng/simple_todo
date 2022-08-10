import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo/domain/todos_service.dart';
import 'package:simple_todo/models/task.dart';

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({Key? key}) : super(key: key);

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('New task'),
      content: TextField(
        decoration: const InputDecoration(hintText: 'Enter task\'s name'),
        autofocus: true,
        controller: textEditingController,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);

            final taskName = textEditingController.text;
            if (taskName.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Error! Empty task name.'),
                  backgroundColor: Colors.redAccent,
                ),
              );
            } else {
              final todosService =
                  Provider.of<TodosService>(context, listen: false);
              final newTask = Task(title: taskName);
              todosService.addTask(newTask);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Task added: $taskName'),
                  backgroundColor: Colors.green,
                ),
              );
            }
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
