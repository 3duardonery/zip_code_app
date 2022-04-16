import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zip_code_app/components/Footer/footer_component.dart';
import 'package:zip_code_app/models/zipcode_model.dart';
import 'package:zip_code_app/pages/components/bottom_sheet_result_component.dart';
import 'package:zip_code_app/services/zip_code_service.dart';
import 'package:zip_code_app/shared/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchInputController = TextEditingController();

  void submitSearch(BuildContext context, String searchZipValue) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: MediaQuery.maybeOf(context)!.size.height * 0.1,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 15),
            child: Column(
              children: [
                CircularProgressIndicator(
                  backgroundColor: Colors.grey,
                  color: Styles.primaryColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('CONSULTANDO CEP...'),
              ],
            ),
          ),
        );
      },
    );
    var zipCodeResponse = await ZipCodeService().searchZipCode(searchZipValue);

    Navigator.pop(context);

    showResult(context, zipCodeResponse);
  }

  void showResult(BuildContext context, Zipcode zipcode) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return BottomSheetResultComponent(zipcode);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        actions: const [
          Text('CEP'),
          SizedBox(
            width: 50,
          ),
          Text('FIPE'),
        ],
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'CONSULTAR CEP',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 50,
                    left: MediaQuery.of(context).size.width * 0.2,
                    right: MediaQuery.of(context).size.width * 0.2,
                  ),
                  child: TextFormField(
                    key: const Key('inputSearch'),
                    controller: _searchInputController,
                    onFieldSubmitted: (value) {
                      submitSearch(context, _searchInputController.value.text);
                    },
                    maxLength: 8,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.center,
                    style: Styles.labesTextStyle,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      counterStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: InkWell(
                          key: const Key('buttonSearch'),
                          onTap: () {
                            submitSearch(
                                context, _searchInputController.value.text);
                          },
                          child: Icon(
                            Icons.search,
                            color: Styles.primaryColor,
                            size: 40,
                          ),
                        ),
                      ),
                      contentPadding: const EdgeInsets.only(
                        bottom: 15,
                        left: 20,
                      ),
                      labelText: 'DIGITE O CEP',
                      labelStyle: const TextStyle(
                        fontSize: 32,
                        color: Color(0Xff8AA6A3),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: Colors.white,
                      filled: true,
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            right: 100,
            width: MediaQuery.of(context).size.width * 0.3,
            child: SvgPicture.asset('assets/images/location.svg'),
          ),
        ],
      ),
      bottomNavigationBar: const FooterComponent(),
    );
  }
}
