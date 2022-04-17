import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:zip_code_app/models/zipcode_model.dart';
import 'package:zip_code_app/services/zip_code_service_imp.dart';

class ZipCodeService implements ZipCodeServiceImp {
  @override
  Future<Zipcode> searchZipCode(String zip) async {
    final response =
        await http.get(Uri.parse('https://viacep.com.br/ws/$zip/json/'));

    if (response.statusCode == 200) {
      return Zipcode.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
