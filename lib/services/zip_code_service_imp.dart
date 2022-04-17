import '../models/zipcode_model.dart';

abstract class ZipCodeServiceImp {
  Future<Zipcode> searchZipCode(String zip);
}
