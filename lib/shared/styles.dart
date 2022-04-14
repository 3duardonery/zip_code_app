import 'package:flutter/material.dart';

class Styles {
  static Map<int, Color> color = {
    50: const Color.fromRGBO(18, 115, 105, .1),
    100: const Color.fromRGBO(18, 115, 105, .2),
    200: const Color.fromRGBO(18, 115, 105, .3),
    300: const Color.fromRGBO(18, 115, 105, .4),
    400: const Color.fromRGBO(18, 115, 105, .5),
    500: const Color.fromRGBO(18, 115, 105, .6),
    600: const Color.fromRGBO(18, 115, 105, .7),
    700: const Color.fromRGBO(18, 115, 105, .8),
    800: const Color.fromRGBO(18, 115, 105, .9),
    900: const Color.fromRGBO(18, 115, 105, 1),
  };
  static MaterialColor primaryColor = MaterialColor(0xFF127369, color);
  static Color secondaryColor = const Color(0Xff8AA6A3);
  static TextStyle labesTextStyle = const TextStyle(
    fontSize: 32,
    color: Color(0Xff8AA6A3),
  );
}
