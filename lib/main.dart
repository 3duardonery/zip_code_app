import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:zip_code_app/pages/home.dart';
import 'package:zip_code_app/shared/styles.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consulta CEP',
      theme: ThemeData(
        primarySwatch: Styles.primaryColor,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
      },
      onUnknownRoute: (routeSettings) => MaterialPageRoute(
        builder: (context) => const HomePage(),
        settings: routeSettings,
      ),
    );
  }
}
