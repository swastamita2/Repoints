// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:repoint1/app/repoint_app.dart';

void main() {
  testWidgets('App renders home shell', (WidgetTester tester) async {
    await tester.pumpWidget(const RePointApp());

    // Pastikan bottom nav muncul
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Reward'), findsOneWidget);

    // Pastikan ringkasan poin tampil
    expect(find.textContaining('Poin'), findsWidgets);
  });
}
