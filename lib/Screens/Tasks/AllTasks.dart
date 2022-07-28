import 'package:flutter/material.dart';
import 'package:plan_em/TaskDatabase.dart';
import 'package:plan_em/reusable_components/TaskListTile.dart';
import '../../Data models/Task.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({Key? key}) : super(key: key);

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  TaskDatabase databaseHandler=TaskDatabase();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      child: FutureBuilder<List<Task>>(
        future:
        databaseHandler.getAllTasks(),
        builder: (context, future) {
          if (future.data != null) {
            //has no data
            return Center(
              child: Text("You haven't created tasks yet.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor)),
            );
          } else {
            List<Task> tasks = future.data!;
            return ListView.builder(
                //to be assigned to fetched list.size
                itemCount: tasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return TaskListTile(
                      taskLabel: tasks[index].taskLabel,
                      isComplete: tasks[index].isComplete,
                      isFavorite: tasks[index].isFavorite);
                });
          }
        },
      ),
    );
  }
}
