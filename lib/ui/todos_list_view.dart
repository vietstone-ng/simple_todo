// Layout the todos list view
// TODO: layout list view
// TODO: inject model as dependencies
import 'package:flutter/material.dart';
import 'package:simple_todo/ui/view_models/todos_view_model.dart';

class TodosListView extends StatelessWidget {
  const TodosListView({Key? key, required this.viewModel}) : super(key: key);

  final TodosViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: viewModel.color,
    );
  }
}
