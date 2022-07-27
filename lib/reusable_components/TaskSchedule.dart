import 'dart:math';

import 'package:flutter/material.dart';

import 'Constants.dart';

class TaskSchedule extends StatefulWidget {
  String taskLabel, startTime;
  bool isComplete;

  TaskSchedule(
      {Key? key,
      required this.taskLabel,
      required this.startTime,
      required this.isComplete})
      : super(key: key);

  @override
  State<TaskSchedule> createState() => _TaskScheduleState();
}

class _TaskScheduleState extends State<TaskSchedule> {
  Random random = new Random();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Container(
        padding: EdgeInsets.all(12),
        height: 90,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            color: colors[random.nextInt(colors.length)]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //will represent label and start time
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.startTime,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Theme.of(context).backgroundColor),
                ),
                Text(
                  widget.taskLabel,
                  style: TextStyle(
                      fontSize: 15, color: Theme.of(context).backgroundColor),
                )
              ],
            ),
            Checkbox(
                fillColor: MaterialStateProperty.all<Color>(Colors.transparent),
                checkColor: Colors.white,
                side: MaterialStateBorderSide.resolveWith(
                    (states) => BorderSide(width: 1.0, color: Colors.white)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                value: widget.isComplete,
                onChanged: (v) {
                  setState(() {
                    widget.isComplete = v!;
                  });
                })
          ],
        ),
      ),
    );
  }
}
