import 'package:flutter/material.dart';
import 'package:plan_em/reusable_components/DateTimeSelector.dart';
import 'package:plan_em/reusable_components/InputFieldWithLabel.dart';
import 'package:plan_em/reusable_components/PrimaryButton.dart';

class TaskCreationScreen extends StatefulWidget {
  const TaskCreationScreen({Key? key}) : super(key: key);

  @override
  State<TaskCreationScreen> createState() => _TaskCreationScreenState();
}

class _TaskCreationScreenState extends State<TaskCreationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        foregroundColor: Colors.black87,
        title: const Text(
          "Add Task",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        leading: const Icon(Icons.arrow_back_ios),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //form
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const InputFieldWithLabel(
                  label: "Title",
                  hint: "Finish to-do app implementation",
                  width: 300),
              const DateTimeSelector(
                  label: "Deadline",
                  hint: "2021-02-22",
                  width: 300,
                  isDatePicker: true),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  DateTimeSelector(
                      label: "Start time",
                      hint: "9:00 Am",
                      width: 120,
                      isDatePicker: false),
                  DateTimeSelector(
                      label: "End time",
                      hint: "1:00 Pm",
                      width: 120,
                      isDatePicker: false),
                ],
              ),
              //todo: add last 2 fields
            ],
          ),
          PrimaryButton(
              label: "Create a Task",
              onClickFunction: () {
                //implement onClick for submit button
              })
        ],
      ),
    );
  }
}
