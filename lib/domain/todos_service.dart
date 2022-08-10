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
      Task(title: 'Test 1', completed: true),
      Task(title: 'Test 2', completed: false),
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
