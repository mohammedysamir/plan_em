import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plan_em/Cubits/task_cubit.dart';
import 'package:plan_em/TaskDatabase.dart';

import '../Data models/Task.dart';
import 'Constants.dart';

class TaskListTile extends StatefulWidget {
  String taskLabel;
  int isFavorite, isComplete;

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
    Random random = new Random();
    return BlocProvider.value(
      value:BlocProvider.of<TaskCubit>(context),
      child: ListTile(
          leading: BlocBuilder<TaskCubit, TaskState>(
              builder: (context, state) {
                if (state is TaskCompleted || state is TaskUncompleted) {
                  return Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      value: widget.isComplete==1,
                      //todo: make the color non-changing using bloc
                      fillColor: MaterialStateProperty.all<Color>(
                          colors[random.nextInt(colors.length)]),
                      onChanged: (change) {
                        widget.isComplete = change!?1:0;
                        BlocProvider.of<TaskCubit>(context).markIsCompleted(
                            Task(
                                taskLabel: widget.taskLabel,
                                isFavorite: widget.isFavorite,
                                isComplete: widget.isComplete),
                            widget.isComplete);
                      });
                }
                //todo: need to find a solution to checkbox states
                return Center();
              }
          ),
          title: Text(
            widget.taskLabel,
            style: TextStyle(
                color: Theme
                    .of(context)
                    .primaryColor,
                fontSize: 18,
                decoration: widget.isComplete==1
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
          trailing: BlocBuilder<TaskCubit, TaskState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  //add function to mark task as favorite
                    widget.isFavorite = widget.isFavorite==1?1:0;
                    BlocProvider.of<TaskCubit>(context).markIsFavorite(
                        Task(
                            taskLabel: widget.taskLabel,
                            isFavorite: widget.isFavorite,
                            isComplete: widget.isComplete),
                        widget.isFavorite);
                },
                child: Icon(
                  widget.isFavorite==1 ? Icons.star : Icons.star_border_outlined,
                  color: Colors.yellow,
                ),
              );
            },
          )),
    );
  }
}
