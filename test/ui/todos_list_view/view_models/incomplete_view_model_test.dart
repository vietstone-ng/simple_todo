import 'package:mocktail/mocktail.dart';
import 'package:simple_todo/domain/todos_service.dart';
import 'package:simple_todo/models/task.dart';
import 'package:simple_todo/ui/todos_list_view/view_models/incomplete_view_model.dart';
import 'package:test/test.dart';

final testData = [
  Task(title: 'Title 1', completed: false),
  Task(title: 'Title 2', completed: true),
  Task(title: 'Title 3', completed: true),
  Task(title: 'Title 4', completed: false),
];

class MockTodosService extends Mock implements TodosService {}

void main() {
  group('Test ViewModel for All screen', () {
    final mockService = MockTodosService();
    when(() => mockService.todosStream)
        .thenAnswer((_) => Stream.value(testData));

    final vm = IncompleteViewModel(service: mockService);

    test('return incompleted todos', () {
      expect(
          vm.dataStream, emits(testData.where((e) => !e.completed).toList()));
    });
  });
}
