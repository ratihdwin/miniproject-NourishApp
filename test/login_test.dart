import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:NourishApp/View/login.dart';

void main() {
  testWidgets("Testing 1 Text, 2 Field dan 1 Button", (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(home: LoginPage()));

    expect(find.byKey(const Key('titleNourishApp')), findsOneWidget);
    expect(find.byKey(const Key('usernameTextField')), findsOneWidget);
    expect(find.byKey(const Key('passwordTextField')), findsOneWidget);
    expect(find.byKey(const Key('signinButton')), findsNWidgets(1));

    await widgetTester.enterText(find.byKey(const Key('usernameTextField')), 'Alta');
    expect(find.text('Alta'), findsOneWidget);
    await widgetTester.enterText(find.byKey(const Key('passwordTextField')), 'Alta123');
    expect(find.text('Alta123'), findsOneWidget);

    await widgetTester.tap(find.byType(ElevatedButton));
    await widgetTester.pump();
  });
}