import 'package:flutter/material.dart';

class InputFieldWithLabel extends StatelessWidget {
  String label, hint;
  int width;
  InputFieldWithLabel(
      {Key? key, required this.label, required this.hint, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: hint,
                  fillColor: Colors.black12,
                  filled: true,
                ),
              ),
            ),
          ]),
    );
  }
}