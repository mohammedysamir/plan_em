import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plan_em/Cubits/task_cubit.dart';

import '../../Data models/Task.dart';
import '../../reusable_components/TaskListTile.dart';

class UncompletedTasks extends StatefulWidget {
  const UncompletedTasks({Key? key}) : super(key: key);

  @override
  State<UncompletedTasks> createState() => _UncompletedTasksState();
}

class _UncompletedTasksState extends State<UncompletedTasks> {
  late List<Task> uncompletedTasks;

  @override
  initState() {
    super.initState();
    uncompletedTasks =
        BlocProvider.of<TaskCubit>(context).fetchUncompletedTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.75,
        child: BlocBuilder<TaskCubit, TaskState>(builder: (context, state) {
          if (state is TasksFetched) {
            return ListView.builder(
                //to be assigned to fetched list.size
                itemCount: uncompletedTasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return TaskListTile(
                      taskLabel: uncompletedTasks[index].taskLabel,
                      isComplete: uncompletedTasks[index].isComplete,
                      isFavorite: uncompletedTasks[index].isFavorite);
                });
          } else {
            return Center(
              child: Text("You haven't created uncompletedTasks yet.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor)),
            );
          }
        }));
  }
}
