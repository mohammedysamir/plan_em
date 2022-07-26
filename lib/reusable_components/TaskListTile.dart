import 'dart:math';

import 'package:flutter/material.dart';
import 'package:plan_em/TaskDatabase.dart';

import 'Constants.dart';

class TaskListTile extends StatefulWidget {
  String taskLabel;
  bool isFavorite, isComplete;

  TaskListTile(
      {Key? key,
      required this.taskLabel,
      required this.isComplete,
      required this.isFavorite})
      : super(key: key);

  @override
  State<TaskListTile> createState() => _TaskListTileState();
}

class _TaskListTileState extends State<TaskListTile> {
  @override
  Widget build(BuildContext context) {
    Random random = new Random();
    return ListTile(
        leading: Checkbox(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            value: widget.isComplete,
            fillColor: MaterialStateProperty.all<Color>(
                colors[random.nextInt(colors.length)]),
            onChanged: (change) {
              setState(() {
                widget.isComplete = change!;
                TaskDatabase.instance
                    .updateCompletedTask(widget.taskLabel, widget.isComplete);
                //todo: test update function
              });
            }),
        title: Text(
          widget.taskLabel,
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 18,
              decoration: widget.isComplete
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
        ),
        trailing: GestureDetector(
          onTap: () {
            //add function to mark task as favorite
            setState(() {
              widget.isFavorite = !widget.isFavorite;
              TaskDatabase.instance
                  .updateFavoriteTask(widget.taskLabel, widget.isFavorite);
              //todo: test update function
            });
          },
          child: Icon(
            widget.isFavorite ? Icons.star : Icons.star_border_outlined,
            color: Colors.yellow,
          ),
        ));
  }
}
