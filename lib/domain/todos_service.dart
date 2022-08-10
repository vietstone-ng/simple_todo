// This service provides data as single source of truth to the presentation (ui) layer.
// This service also received actions from presentation (ui) layer via functions.
import 'package:rxdart/subjects.dart';
import 'package:simple_todo/data/todos_local_storage.dart';
import 'package:simple_todo/models/task.dart';

class TodosService {
  TodosService({required TodosLocalStorage storage}) : _storage = storage {
    // load data from storage
    Future.microtask(() async {
      final todos = await _storage.loadTodos();
      _subject.add(todos ?? []);
    });
  }

  final TodosLocalStorage _storage;

  final _subject = BehaviorSubject<List<Task>>();

  Stream<List<Task>> get todosStream => _subject.stream;

  void completeTask(Task t) {
    assert(_subject.value.contains(t));

    final newList = List<Task>.from(_subject.value);
    final index = newList.indexOf(t);
    newList.removeAt(index);
    newList.insert(index, t.copyWith(completed: true));

    _subject.add(newList);
    _storage.saveTodos(newList);
  }

  void uncompleteTask(Task t) {
    assert(_subject.value.contains(t));

    final newList = List<Task>.from(_subject.value);
    final index = newList.indexOf(t);
    newList.removeAt(index);
    newList.insert(index, t.copyWith(completed: false));

    _subject.add(newList);
    _storage.saveTodos(newList);
  }

  void addTask(Task t) {
    assert(!_subject.value.contains(t));

    final newList = List<Task>.from(_subject.value);
    newList.insert(0, t);

    _subject.add(newList);
    _storage.saveTodos(newList);
  }

  void removeTask(Task t) {
    assert(_subject.value.contains(t));

    final newList = List<Task>.from(_subject.value);
    final index = newList.indexOf(t);
    newList.removeAt(index);

    _subject.add(newList);
    _storage.saveTodos(newList);
  }

  void dispose() {
    _subject.close();
    _storage.dispose();
  }
}
