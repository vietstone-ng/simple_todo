import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo/domain/todos_service.dart';
import 'package:simple_todo/ui/add_task_dialog.dart';
import 'package:simple_todo/ui/todos_list_view/todos_list_view.dart';
import 'package:simple_todo/ui/todos_list_view/view_models/complete_view_model.dart';
import 'package:simple_todo/ui/todos_list_view/view_models/incomplete_view_model.dart';
import 'package:simple_todo/ui/todos_list_view/view_models/todos_view_model.dart';

// The HomePage layouts 3 screens with a bottom navigation bar, and provides Create task UI.
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final todosService = Provider.of<TodosService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Todo'),
        actions: [
          IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (_) => const AddTaskDialog(),
            ),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.all_inclusive,
              key: Key('all-item'),
            ),
            label: 'All',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.check_box,
              key: Key('complete-item'),
            ),
            label: 'Complete',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.check_box_outline_blank,
              key: Key('incomplete-item'),
            ),
            label: 'Incomplete',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          // TODO: check keys
          TodosListView(
            key: const Key('all-list'),
            viewModel: TodosViewModel(service: todosService),
          ),
          TodosListView(
            key: const Key('complete-list'),
            viewModel: CompleteViewModel(service: todosService),
          ),
          TodosListView(
            key: const Key('incomplete-list'),
            viewModel: IncompleteViewModel(service: todosService),
          ),
        ],
      ),
    );
  }
}
