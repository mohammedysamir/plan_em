import 'package:flutter/material.dart';

class InputFieldWithLabel extends StatefulWidget {
  final String label, hint;
  final int width;
  const InputFieldWithLabel(
      {Key? key, required this.label, required this.hint, required this.width})
      : super(key: key);

  @override
  State<InputFieldWithLabel> createState() => _InputFieldWithLabelState();
}

class _InputFieldWithLabelState extends State<InputFieldWithLabel> {
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
              widget.label,
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
                  labelText: widget.hint,
                  fillColor: Colors.black12,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).accentColor
                    )
                  ),

                  filled: true,
                ),
              ),
            ),
          ]),
    );
  }
}