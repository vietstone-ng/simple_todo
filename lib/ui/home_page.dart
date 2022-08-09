import 'package:flutter/material.dart';
import 'package:simple_todo/ui/todos_list_view.dart';
import 'package:simple_todo/ui/view_models/all_view_model.dart';
import 'package:simple_todo/ui/view_models/complete_view_model.dart';
import 'package:simple_todo/ui/view_models/incomplete_view_model.dart';

// The HomePage layouts 3 screens with a bottom navigation bar, and provides Create task UI.
// TODO: layout
// TODO: inject view models for screens
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Todo'),
        actions: [
          IconButton(
            onPressed: () {},
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
        children: const [
          TodosListView(
            key: Key('all-list'),
            viewModel: AllViewModel(),
          ),
          TodosListView(
            key: Key('complete-list'),
            viewModel: CompleteViewModel(),
          ),
          TodosListView(
            key: Key('incomplete-list'),
            viewModel: IncompleteViewModel(),
          ),
        ],
      ),
    );
  }
}
