import 'package:flutter/material.dart';

class OnHover extends StatefulWidget {
  final Widget Function(bool _isHover) builder;

  const OnHover({Key? key, required this.builder}) : super(key: key);

  @override
  _OnHoverState createState() => _OnHoverState();
}

class _OnHoverState extends State<OnHover> {
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    final hovered = Matrix4.identity()..translate(0, -1, 0);
    final transform = _isHover ? hovered : Matrix4.identity();

    return MouseRegion(
      onEnter: (_) => onEntered(true),
      onExit: (_) => onEntered(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        transform: transform,
        child: widget.builder(_isHover),
      ),
    );
  }

  void onEntered(bool _isHover) {
    setState(() {
      this._isHover = _isHover;
    });
  }
}
