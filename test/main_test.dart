import 'package:flutter_test/flutter_test.dart';

import './home_page_test.dart' as home_page_test;
import './footer_component_tests.dart' as footer_test;

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });
  home_page_test.main();
  footer_test.main();
}
