import 'package:flutter/material.dart';

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
    return ListTile(
      leading: Checkbox(
          value: widget.isComplete,
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
