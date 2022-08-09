import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_todo/ui/home_page.dart';

Widget createHomeScreen() => const MaterialApp(home: HomePage());

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
