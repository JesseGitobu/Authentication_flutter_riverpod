import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool obscure;
  final String hint;
  final String title;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final Widget prefix;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.obscure,
    required this.hint,
    required this.title,
    required this.onSaved,
    required this.validator,
    required this.prefix,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscure,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: widget.hint,
        labelText: widget.title,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(
              color: Colors.black87, width: 2, style: BorderStyle.solid),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(
              color: Colors.black87, width: 2, style: BorderStyle.solid),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(
              color: Colors.redAccent, width: 2, style: BorderStyle.solid),
        ),
        border: InputBorder.none,
        prefixIcon: widget.prefix,
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        fillColor: Colors.white,
      ),
      onSaved: widget.onSaved,
      validator: widget.validator,
    );
  }
}
