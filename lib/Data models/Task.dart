import 'package:flutter/material.dart';

class Task {
  final String taskLabel;
  final Repetition? repetition;
  final String? reminder,startTime,endTime,deadline;
  final bool isFavorite, isComplete;

  const Task(
      {required this.taskLabel,
      required this.isFavorite,
      required this.isComplete,
      this.repetition,
      this.startTime,
      this.endTime,
      this.deadline,
      this.reminder});
}

/*
* Enumeration to make the repetition discrete not a string.
* */
enum Repetition { daily, weekly, monthly, yearly }

const List Reminder = [
  "10 minutes early",
  "30 minutes early",
  "1 hour early",
  "1 day early",
  "1 week before",
  "1 month before"
];
