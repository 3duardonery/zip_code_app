import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:zip_code_app/models/zipcode_model.dart';

class ZipCodeService {
  Future<Zipcode> searchZipCode(String zip) async {
    final response =
        await http.get(Uri.parse('https://viacep.com.br/ws/$zip/json/'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Zipcode.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
