import 'package:flutter/material.dart';

class InputFieldWithLabel extends StatelessWidget {
  String label, hint;
  int width;
  Icon? endIcon;

  InputFieldWithLabel(
      {Key? key,
      required this.label,
      required this.hint,
      required this.width,
      this.endIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
