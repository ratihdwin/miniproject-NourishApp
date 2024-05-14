import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:NourishApp/View/gpt_food.dart';

void main() {
  testWidgets("Testing 1 Text, 1 Field", (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(home: GptFood(title: '',)));

    expect(find.byKey(const Key('rekomendasiMakananBayi')), findsOneWidget);
    expect(find.byKey(const Key('usiaTextFromField')), findsOneWidget);

    await widgetTester.enterText(find.byKey(const Key('usiaTextFromField')), '8');
    expect(find.text('8'), findsOneWidget);

    await widgetTester.pump();
  });
}