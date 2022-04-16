import 'package:flutter/material.dart';
import 'package:zip_code_app/models/zipcode_model.dart';

class BottomSheetResultComponent extends StatelessWidget {
  final Zipcode zipcode;
  const BottomSheetResultComponent(this.zipcode, {Key? key}) : super(key: key);

  SelectableText _getLabel(String label) {
    return SelectableText(
      label,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  SelectableText _getValue(String? value) {
    return SelectableText(
      value ?? '',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color(0xff8AA6A3),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            const SelectableText(
              'Resultado do CEP pesquisado',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _getLabel('LOGRADOURO:'),
                const SizedBox(
                  width: 10,
                ),
                _getValue(zipcode.logradouro),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _getLabel('CEP:'),
                const SizedBox(
                  width: 10,
                ),
                _getValue(zipcode.cep),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _getLabel('COMPLEMENTO:'),
                const SizedBox(
                  width: 10,
                ),
                _getValue(zipcode.complemento),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _getLabel('BAIRRO:'),
                const SizedBox(
                  width: 10,
                ),
                _getValue(zipcode.bairro),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _getLabel('LOCALIDADE:'),
                const SizedBox(
                  width: 10,
                ),
                _getValue(zipcode.localidade),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _getLabel('UF:'),
                const SizedBox(
                  width: 10,
                ),
                _getValue(zipcode.uf),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _getLabel('CÓDIGO IBGE:'),
                const SizedBox(
                  width: 10,
                ),
                _getValue(zipcode.ibge),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              child: const Text('FECHAR RESULTADO'),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }
}
