import 'package:flutter/material.dart';

import '../../Data models/Task.dart';
import '../../TaskDatabase.dart';
import '../../reusable_components/TaskListTile.dart';

//todo: create list of listTiles to be viewed and fetched from DB
class FavoriteTasks extends StatefulWidget {
  const FavoriteTasks({Key? key}) : super(key: key);

  @override
  State<FavoriteTasks> createState() => _FavoriteTasksState();
}

class _FavoriteTasksState extends State<FavoriteTasks> {
  late TaskDatabase databaseHandler;

  @override
  initState() {
    super.initState();
    databaseHandler = TaskDatabase();
    databaseHandler.initiateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      child: FutureBuilder<List<Task>>(
        future: databaseHandler.getFavoriteTasks(),
        builder: (context, future) {
          if (future.data != null) {
            //has no data
            return Center(
              child: Text("You haven't mark any task as favorite yet.",
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
