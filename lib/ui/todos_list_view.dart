// Layout the todos list view
// TODO: layout list view
// TODO: inject model as dependencies
import 'package:flutter/material.dart';
import 'package:simple_todo/models/task.dart';
import 'package:simple_todo/ui/view_models/todos_view_model.dart';

class TodosListView extends StatelessWidget {
  const TodosListView({Key? key, required this.viewModel}) : super(key: key);

  final TodosViewModel viewModel;

  Widget _buildListView(List<Task> todos) {
    return ListView.separated(
      itemCount: todos.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        final task = todos[index];
        return ListTile(
          title: Text(task.title),
          leading: InkWell(
              onTap: () {
                if (task.completed) {
                  viewModel.uncompleteTask(task);
                } else {
                  viewModel.completeTask(task);
                }
              },
              child: Icon(
                task.completed
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                size: 50,
              )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Task>>(
      stream: viewModel.dataStream,
      builder: (context, snapshot) {
        final todos = snapshot.data;
        if (todos == null) {
          return const Center(child: Text('Loading ...'));
        } else if (todos.isEmpty) {
          return const Center(child: Text('No task'));
        }

        return _buildListView(todos);
      },
    );
  }
}
