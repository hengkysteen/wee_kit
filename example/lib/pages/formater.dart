import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wee_kit/input_format.dart';

class FormaterPage extends StatelessWidget {
  const FormaterPage({Key? key}) : super(key: key);

  Widget _inputCard(String labelText, String locale, {String symbol = "", int? decimalDigits}) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(labelText: labelText),
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            WeeTextInputFormaterCurrency(locale, symbol: symbol, decimalDigits: decimalDigits),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("WeeTextInputFormaterCurrency")),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          _inputCard("IDR", "id_ID", decimalDigits: 0),
          _inputCard("USD", "en_US"),
        ],
      ),
    );
  }
}
