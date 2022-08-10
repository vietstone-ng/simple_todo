import 'package:mocktail/mocktail.dart';
import 'package:simple_todo/data/todos_local_storage.dart';
import 'package:simple_todo/domain/todos_service.dart';
import 'package:simple_todo/models/task.dart';
import 'package:test/test.dart';

final task_1 = Task(title: '01', completed: true);
final task_2 = Task(title: '02', completed: false);
final task_3 = Task(title: '03', completed: false);
final task_4 = Task(title: '04', completed: true);

final testData = [task_1, task_2, task_3, task_4];

class MockStorage extends Mock implements TodosLocalStorage {}

void main() {
  late MockStorage mockStorage;
  late TodosService service;

  setUp(() {
    mockStorage = MockStorage();
    when(() => mockStorage.loadTodos()).thenAnswer((_) async => testData);
    when(() => mockStorage.saveTodos(any())).thenAnswer((_) async {});
    service = TodosService(storage: mockStorage);
  });

  group('Todos Service Test', () {
    test('init service', () {
      expect(service.todosStream, emits(testData));
    });

    test('complete task', () {
      service.completeTask(task_2);

      final changedData = [
        task_1,
        task_2.copyWith(completed: true),
        task_3,
        task_4,
      ];

      verify(() => mockStorage.saveTodos(changedData)).called(1);
      expect(
        service.todosStream,
        emits(changedData),
      );
    });

    test('uncomplete task', () {
      service.uncompleteTask(task_4);

      final changedData = [
        task_1,
        task_2,
        task_3,
        task_4.copyWith(completed: false),
      ];

      verify(() => mockStorage.saveTodos(changedData)).called(1);
      expect(
        service.todosStream,
        emits(changedData),
      );
    });

    test('add task', () {
      final newTask = Task(title: 'new', completed: false);

      service.addTask(newTask);

      final changedData = [
        newTask,
        task_1,
        task_2,
        task_3,
        task_4,
      ];

      verify(() => mockStorage.saveTodos(changedData)).called(1);
      expect(
        service.todosStream,
        emits(changedData),
      );
    });

    test('remove task', () {
      service.removeTask(task_3);

      final changedData = [
        task_1,
        task_2,
        task_4,
      ];

      verify(() => mockStorage.saveTodos(changedData)).called(1);
      expect(
        service.todosStream,
        emits(changedData),
      );
    });
  });
}
