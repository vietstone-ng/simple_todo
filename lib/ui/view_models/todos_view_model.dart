// ViewModel interface to be used in TodosListView.
import 'package:simple_todo/domain/todos_service.dart';
import 'package:simple_todo/models/task.dart';

class TodosViewModel {
  const TodosViewModel({required TodosService service}) : _service = service;

  final TodosService _service;

  Stream<List<Task>> get dataStream => _service.todosStream;

  void completeTask(Task t) => _service.completeTask(t);

  void uncompleteTask(Task t) => _service.uncompleteTask(t);
}
