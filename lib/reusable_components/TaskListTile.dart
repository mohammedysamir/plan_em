import 'package:flutter/material.dart';
import 'dart:math';

class TaskListTile extends StatefulWidget {
  String taskLabel;
  bool isFavorite, isComplete;

  TaskListTile({Key? key,
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
    Random random=new Random();
    return ListTile(
      leading: Checkbox(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
          value: widget.isComplete,
          fillColor: MaterialStateProperty.all<Color>(Color.fromRGBO(
            random.nextInt(255)+100,
            random.nextInt(255)+100,
            random.nextInt(255)+100,
            1,
          )),
          onChanged: (change) {
            setState(() {
              widget.isComplete = change!;
              //todo: edit completeness in db
            });
          }),
      title: Text(
        widget.taskLabel,
        style: TextStyle(
            color: Theme
                .of(context)
                .primaryColor,
            fontSize: 18,
            decoration: widget.isComplete
                ? TextDecoration.lineThrough
                : TextDecoration.none),
      ),
      trailing: GestureDetector(
        onTap: () {
          //add function to mark task as favorite
          setState((){
            widget.isFavorite = !widget.isFavorite;
            //todo: complete this function with  db
          });
        },
        child: Icon(
          widget.isFavorite ? Icons.star : Icons.star_border_outlined,
          color: Colors.yellow,
        ),
      )
    );
  }
}
