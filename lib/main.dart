import 'package:flutter/material.dart';
import 'package:zip_code_app/pages/home.dart';
import 'package:zip_code_app/shared/styles.dart';

void main() {
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
      home: const HomePage(),
    );
  }
}
