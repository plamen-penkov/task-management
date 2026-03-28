import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:task_management/providers/task_provider.dart';
import 'package:task_management/screens/home_screen.dart';

void main() {
  testWidgets('App renders HomeScreen with tasks', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => TaskProvider(),
        child: const MaterialApp(
          home: HomeScreen(),
        ),
      ),
    );

    // Verify that hardcoded tasks are displayed.
    expect(find.text('Buy groceries'), findsOneWidget);
    expect(find.text('Complete Flutter project'), findsOneWidget);

    // Verify the FAB is present.
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}
