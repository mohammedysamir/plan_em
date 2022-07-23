import 'package:flutter/material.dart';
import 'package:plan_em/reusable_components/DateTimeSelector.dart';
import 'package:plan_em/reusable_components/InputFieldWithLabel.dart';
import 'package:plan_em/reusable_components/PrimaryButton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Plan 'em",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
            body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InputFieldWithLabel(
                    label: "Title",
                    hint: "Design team meeting",
                    width: 300),
                DateTimeSelector(label: "Deadline", hint: "2021-02-26", width: 300, isDatePicker: true),
                PrimaryButton(label: "Create a task", onClickFunction: () {})
              ],
            ),
          ),
        )));
  }
}
