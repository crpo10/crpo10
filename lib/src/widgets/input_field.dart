import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  InputField({
    Key? key,
    required this.label,
    required this.controller,
    this.multiLine = false,
    this.obscureText = false,
    this.inputEnable = false,
    this.suffix,
    this.validator,
  }) : super(key: key);

  final String label;
  final TextEditingController controller;
  bool obscureText, inputEnable, multiLine;
  final Widget? suffix;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        validator: validator,
        enabled: !inputEnable,
        obscureText: obscureText,
        controller: controller,
        cursorColor: Colors.white,
        maxLines: (!multiLine) ? 1 : 4,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          suffix: suffix,
          label: Text(label),
          labelStyle: const TextStyle(color: Colors.white),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
