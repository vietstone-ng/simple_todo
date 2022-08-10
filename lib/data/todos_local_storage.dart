// Local storage
import 'package:simple_todo/models/task.dart';

class TodosLocalStorage {
  void dispose() {}

  Future<List<Task>?> loadTodos() async {
    // TODO: mock
    return [
      Task(title: 'Test 1', completed: true),
      Task(title: 'Test 2', completed: false),
      Task(title: 'Test 3', completed: false),
    ];
  }

  Future<void> saveTodos(List<Task> todos) async {
    // TODO
  }
}
