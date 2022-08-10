import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo/domain/todos_service.dart';
import 'package:simple_todo/models/task.dart';
import 'package:simple_todo/ui/home_page.dart';

class MockTodosService extends Mock implements TodosService {}

final task_1 = Task(title: '01', completed: true);
final task_2 = Task(title: '02', completed: false);
final task_3 = Task(title: '03', completed: false);
final task_4 = Task(title: '04', completed: true);

final testData = [task_1, task_2, task_3, task_4];

Widget createHomeScreen() {
  return Provider<TodosService>(
    create: (_) {
      final mockService = MockTodosService();
      when(() => mockService.todosStream)
          .thenAnswer((_) => Stream.value(testData));
      return mockService;
    },
    dispose: (_, service) => service.dispose(),
    child: const MaterialApp(
      home: HomePage(),
    ),
  );
}

void main() {
  group('Home Page Widget Test', () {
    testWidgets('Layout correctness at launch time', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byKey(const Key('all-item')), findsOneWidget);
      expect(find.byKey(const Key('complete-item')), findsOneWidget);
      expect(find.byKey(const Key('incomplete-item')), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
    });
  });
}
