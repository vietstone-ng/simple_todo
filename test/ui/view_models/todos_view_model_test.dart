import 'package:mocktail/mocktail.dart';
import 'package:simple_todo/domain/todos_service.dart';
import 'package:simple_todo/models/task.dart';
import 'package:simple_todo/ui/view_models/todos_view_model.dart';
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

    final vm = TodosViewModel(service: mockService);

    test('return all todos', () {
      expect(vm.dataStream, emits(testData));
    });

    test('call to service', () {
      const task_1 = Task('101', 'Title 101', false);
      const task_2 = Task('102', 'Title 102', false);

      vm.completeTask(task_1);
      vm.uncompleteTask(task_2);

      verifyInOrder([
        () => mockService.completeTask(task_1),
        () => mockService.uncompleteTask(task_2),
      ]);
    });
  });
}
