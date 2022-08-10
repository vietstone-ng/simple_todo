import 'package:mocktail/mocktail.dart';
import 'package:simple_todo/domain/todos_service.dart';
import 'package:simple_todo/models/task.dart';
import 'package:simple_todo/ui/view_models/todos_view_model.dart';
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

    final vm = TodosViewModel(service: mockService);

    test('return all todos', () {
      expect(vm.dataStream, emits(testData));
    });

    test('call to service', () {
      final task_1 = testData.first;
      final task_2 = testData.last;

      vm.completeTask(task_1);
      vm.uncompleteTask(task_2);

      verifyInOrder([
        () => mockService.completeTask(task_1),
        () => mockService.uncompleteTask(task_2),
      ]);
    });
  });
}
