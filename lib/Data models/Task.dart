import 'package:flutter/material.dart';

class Task {
  final String taskLabel;
  final Repetition? repetition;

  //todo: add reminder
  final TimeOfDay? startTime, endTime;
  final DateTime? deadline;

  const Task(
      {required this.taskLabel,
      this.repetition,
      this.startTime,
      this.endTime,
      this.deadline});
}
/*
* Enumeration to make the repetition discrete not a string.
* */
enum Repetition { daily, weekly, monthly, yearly }
