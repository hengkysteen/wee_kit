import 'package:flutter/material.dart';

class WeeInput extends StatelessWidget {
  final TextEditingController controller;
  final bool isDense;
  final FormFieldValidator<String> validator;
  final WeeInputStyle style;
  final BorderRadius borderRadius;
  final BorderSide borderSide;
  final String hintText;
  final bool filled;
  final Color filledColor;
  final TextCapitalization textCapitalization;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final String labelText;
  final void Function(String) onChanged;
  WeeInput({
    Key key,
    this.controller,
    this.isDense,
    this.validator,
    this.style = WeeInputStyle.underline,
    this.borderRadius = BorderRadius.zero,
    this.borderSide = const BorderSide(),
    this.hintText,
    this.filled,
    this.filledColor,
    this.textCapitalization = TextCapitalization.none,
    this.suffixIcon,
    this.prefixIcon,
    this.labelText,
    this.onChanged,
  });

  InputBorder inputBorder() {
    if (style == WeeInputStyle.rounded) {
      return OutlineInputBorder(borderRadius: borderRadius, borderSide: borderSide);
    }
    return UnderlineInputBorder(borderRadius: borderRadius, borderSide: borderSide);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: isDense,
        hintText: hintText,
        filled: filled,
        labelText: labelText,
        fillColor: filledColor,
        border: inputBorder(),
        focusedBorder: inputBorder(),
        enabledBorder: inputBorder(),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        suffixIconConstraints: BoxConstraints(maxWidth: 50, maxHeight: 50),
      ),
      textCapitalization: textCapitalization,
      onChanged: onChanged,
    );
  }
}

enum WeeInputStyle { rounded, underline }
