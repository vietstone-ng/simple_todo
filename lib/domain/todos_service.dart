// This service provides data as single source of truth to the presentation (ui) layer.
// This service also received actions from presentation (ui) layer via functions.
import 'package:rxdart/subjects.dart';
import 'package:simple_todo/models/task.dart';

class TodosService {
  final _subject = BehaviorSubject<List<Task>>();

  Stream<List<Task>> get todosStream => _subject.stream;

  TodosService() {
    // TODO: mock data
    _subject.add([
      const Task('123', 'Test 1', true),
      const Task('456', 'Test 2', false),
    ]);
  }

  void completeTask(Task t) {
    // TODO
  }

  void uncompleteTask(Task t) {
    // TODO
  }

  void dispose() {
    // TODO
  }
}
