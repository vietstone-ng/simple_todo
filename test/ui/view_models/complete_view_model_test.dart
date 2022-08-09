import 'package:mocktail/mocktail.dart';
import 'package:simple_todo/domain/todos_service.dart';
import 'package:simple_todo/models/task.dart';
import 'package:simple_todo/ui/view_models/complete_view_model.dart';
import 'package:test/test.dart';

const testData = [
  Task('1', 'Title 1', false),
  Task('2', 'Title 2', true),
  Task('3', 'Title 3', true),
  Task('4', 'Title 4', false),
];

class MockTodosService extends Mock implements TodosService {}

void main() {
  group('Test ViewModel for All screen', () {
    final mockService = MockTodosService();
    when(() => mockService.todosStream)
        .thenAnswer((_) => Stream.value(testData));

    final vm = CompleteViewModel(service: mockService);

    test('return completed todos', () {
      expect(vm.dataStream, emits(testData.where((e) => e.completed).toList()));
    });
  });
}
