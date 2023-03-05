import 'dart:math' show pow;
import 'package:flutter/services.dart' show TextEditingValue, TextInputFormatter, TextSelection;
import 'package:intl/intl.dart';

class WeeTextInputFormaterCurrency extends TextInputFormatter {
  final String locale;
  final String? symbol;
  final int? decimalDigits;
  final int maxDigits;

  WeeTextInputFormaterCurrency(this.locale, {this.symbol, this.decimalDigits, this.maxDigits = 10});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    
    final int newBaseOffset = newValue.selection.baseOffset;
    final String newtext = newValue.text;
    final String text = newtext.replaceAll(RegExp('[^0-9]'), '');

    if (newBaseOffset > maxDigits) {
      return oldValue;
    }

    final currency = NumberFormat.currency(locale: locale, symbol: symbol, decimalDigits: decimalDigits);

    num _newNum = num.tryParse(newValue.text) ?? 0;

    if (currency.decimalDigits! > 0) {
      _newNum /= pow(10, currency.decimalDigits!);
    }
    final _newString = currency.format(_newNum).trim();

    if (text.trim() == '' || text == '00' || text == '000') {
      return TextEditingValue(text: '', selection: TextSelection.collapsed(offset: 0));
    }

    return TextEditingValue(text: _newString, selection: TextSelection.collapsed(offset: _newString.length));
  }
}
