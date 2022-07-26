import 'package:flutter/material.dart';

Widget InputFieldWithLabel(
        {required TextEditingController controller,
        required String label,
        hint,
        required int width,
        required BuildContext context}) =>
    Container(
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
                controller: controller,
                decoration: InputDecoration(
                  labelText: hint,
                  fillColor: Colors.black12,
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).accentColor)),
                  filled: true,
                ),
              ),
            ),
          ]),
    );