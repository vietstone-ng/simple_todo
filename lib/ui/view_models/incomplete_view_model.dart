import 'package:simple_todo/models/task.dart';
import 'package:simple_todo/ui/view_models/todos_view_model.dart';

// // ViewModel for Incomplete screen. This extracts only completed todos from TodosService.
class IncompleteViewModel extends TodosViewModel {
  const IncompleteViewModel({required super.service});

  @override
  Stream<List<Task>> get dataStream => super.dataStream.map(
        (list) => list.where((e) => !e.completed).toList(),
      );
}
