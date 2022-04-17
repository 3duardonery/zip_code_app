// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
library footer_test;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:zip_code_app/components/Footer/footer_component.dart';

void main() {
  testWidgets('Footer Component have a description field',
      (WidgetTester tester) async {
    // Arrange
    Widget testWidget = const MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: Scaffold(
          bottomNavigationBar: FooterComponent(),
        ),
      ),
    );

    // Act
    await tester.pumpWidget(testWidget);

    final titleFinder = find.text('DEVELOPED BY EDUARDO NERY');

    // Assert
    expect(titleFinder, findsOneWidget);
  });
}
