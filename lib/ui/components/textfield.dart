import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final int maxLength;
  final int maxLines;
  final double borderWidth;
  final bool obscureText;
  final bool autofocus;
  final Color errorBorderColor;
  final Color enabledBorderColor;
  final Function validatorFunction;
  final Function(String) onChanged;
  final Function onSaved;
  final String labelText;
  final String initialValue;
  final TextStyle labelStyle;
  final TextStyle style;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final List<TextInputFormatter> inputFormatters;
  final EdgeInsetsGeometry contentPadding;
  final Widget icon;

  CustomTextField({
    @required this.onSaved,
    this.obscureText = false,
    this.autofocus = false,
    this.borderWidth = 0,
    this.maxLines = 1,
    this.enabledBorderColor = Colors.black,
    this.errorBorderColor = Colors.red,
    this.controller,
    this.maxLength,
    this.icon,
    this.labelText,
    this.validatorFunction,
    this.contentPadding,
    this.initialValue,
    this.inputFormatters,
    this.onChanged,
    this.keyboardType,
    this.labelStyle,
    this.style,
  });
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: widget.autofocus,
      maxLines: widget.maxLines,
      inputFormatters: widget.inputFormatters,
      style: widget.style ?? TextStyle(color: Colors.black),
      controller: widget.controller,
      obscureText: widget.obscureText,
      onChanged: widget.onChanged,
      maxLength: widget.maxLength,
      decoration: new InputDecoration(
        contentPadding: widget.contentPadding,
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: widget.errorBorderColor,
          width: widget.borderWidth,
        )),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: widget.enabledBorderColor,
          width: widget.borderWidth,
        )),
        border: new OutlineInputBorder(
            borderSide: new BorderSide(
          width: widget.borderWidth,
        )),
        labelText: widget.labelText,
        labelStyle: widget.labelStyle ?? TextStyle(color: Colors.black),
        suffixIcon: widget.icon,
      ),
      keyboardType: widget.keyboardType,
      onSaved: widget.onSaved,
      validator: widget.validatorFunction,
      initialValue: widget.initialValue,
    );
  }
}
