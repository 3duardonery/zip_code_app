import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:zip_code_app/pages/home.dart';
import 'package:zip_code_app/services/zip_code_service.dart';
import 'package:zip_code_app/services/zip_code_service_imp.dart';
import 'package:zip_code_app/shared/styles.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void main() {
  setPathUrlStrategy();

  getIt.registerFactory<ZipCodeServiceImp>(() => ZipCodeService());

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
