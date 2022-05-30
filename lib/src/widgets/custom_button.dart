import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.fontSize,
      this.onHover,
      required this.color})
      : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final double? fontSize;
  final void Function(bool)? onHover;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: onHover,
      hoverColor: Colors.transparent,
      onTap: onPressed,
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize, color: color),
      ),
    );
  }
}
