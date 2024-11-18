import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:admin_dashboard/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(AdminDashboardApp());

    // Vérifier que le Dashboard est affiché
    expect(find.text('Bienvenue au Dashboard'), findsOneWidget);

    // Vérifiez que notre sidebar et navbar sont présentes
    expect(find.byIcon(Icons.dashboard), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.byIcon(Icons.notifications), findsOneWidget);
  });
}
