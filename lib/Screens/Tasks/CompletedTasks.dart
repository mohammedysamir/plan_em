import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plan_em/Cubits/task_cubit.dart';

import '../../Data models/Task.dart';
import '../../reusable_components/TaskListTile.dart';

class CompletedTasks extends StatefulWidget {
  const CompletedTasks({Key? key}) : super(key: key);

  @override
  State<CompletedTasks> createState() => _CompletedTasksState();
}

class _CompletedTasksState extends State<CompletedTasks> {
  late List<Task> completedTasks;

  @override
  initState() {
    super.initState();
    completedTasks = BlocProvider.of<TaskCubit>(context).fetchCompletedTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      child: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          if (state is TasksFetched) {
            return ListView.builder(
                //to be assigned to fetched list.size
                itemCount: completedTasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return TaskListTile(
                      taskLabel: completedTasks[index].taskLabel,
                      isComplete: completedTasks[index].isComplete,
                      isFavorite: completedTasks[index].isFavorite);
                });
          } else {
            return Center(
              child: Text("You haven't completed any task yet.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor)),
            );
          }
        },
      ),
    );
  }
}
