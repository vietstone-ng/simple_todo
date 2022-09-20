// Local storage
import 'package:hive/hive.dart';
import 'package:simple_todo/constants.dart';
import 'package:simple_todo/models/task.dart';

class TodosLocalStorage {
  final _hiveBox = Hive.box(kHiveTodosBoxName);

  void dispose() {}

  Future<List<Task>?> loadTodos() async {
    return _hiveBox.get(kHiveTodosStoreKey, defaultValue: []).cast<Task>();
  }

  Future<void> saveTodos(List<Task> todos) async {
    await _hiveBox.put(kHiveTodosStoreKey, todos);
  }
}
