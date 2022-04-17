// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import 'package:zip_code_app/pages/home.dart';
import 'package:zip_code_app/services/zip_code_service.dart';
import 'package:zip_code_app/services/zip_code_service_imp.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    GetIt.instance.registerSingleton<ZipCodeServiceImp>(ZipCodeService());
  });
  testWidgets('Home page have a Title', (WidgetTester tester) async {
    // Arrange
    Widget testWidget = const MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );

    // Act
    await tester.pumpWidget(testWidget);

    final titleFinder = find.text('CONSULTAR CEP');

    // Assert
    expect(titleFinder, findsOneWidget);
  });

  testWidgets('Home page have a InputSearch', (WidgetTester tester) async {
    // Arrange
    Widget testWidget = const MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );

    // Act
    await tester.pumpWidget(testWidget);

    final titleFinder = find.byKey(const Key('inputSearch'));

    // Assert
    expect(titleFinder, findsOneWidget);
  });

  testWidgets('Home page have a ButtonSearch', (WidgetTester tester) async {
    // Arrange
    Widget testWidget = const MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );

    // Act
    await tester.pumpWidget(testWidget);

    final titleFinder = find.byKey(const Key('buttonSearch'));

    // Assert
    expect(titleFinder, findsOneWidget);
  });
}
