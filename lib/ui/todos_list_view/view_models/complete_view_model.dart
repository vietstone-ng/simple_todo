import 'package:simple_todo/models/task.dart';
import 'package:simple_todo/ui/todos_list_view/view_models/todos_view_model.dart';

// ViewModel for Complete screen. This extracts only completed todos from TodosService.
class CompleteViewModel extends TodosViewModel {
  const CompleteViewModel({required super.service});

  @override
  Stream<List<Task>> get dataStream => super.dataStream.map(
        (list) => list.where((e) => e.completed).toList(),
      );
}
