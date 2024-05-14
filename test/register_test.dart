import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:NourishApp/View/register.dart';

void main() {
  testWidgets("Testing 1 Text, 2 Field dan 1 Button", (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(home: RegisterPage()));

    expect(find.byKey(const Key('titleRNourishApp')), findsOneWidget);
    expect(find.byKey(const Key('usernameRTextField')), findsOneWidget);
    expect(find.byKey(const Key('passwordRTextField')), findsOneWidget);
    expect(find.byKey(const Key('registerButton')), findsNWidgets(1));

    await widgetTester.enterText(find.byKey(const Key('usernameRTextField')), 'Alta');
    expect(find.text('Alta'), findsOneWidget);
    await widgetTester.enterText(find.byKey(const Key('passwordRTextField')), 'Alta123');
    expect(find.text('Alta123'), findsOneWidget);

    await widgetTester.tap(find.byType(ElevatedButton));
    await widgetTester.pump();
  });
}