import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plan_em/Cubits/task_cubit.dart';

import '../../Data models/Task.dart';
import '../../reusable_components/TaskListTile.dart';

//todo: create list of listTiles to be viewed and fetched from DB
class FavoriteTasks extends StatefulWidget {
  const FavoriteTasks({Key? key}) : super(key: key);

  @override
  State<FavoriteTasks> createState() => _FavoriteTasksState();
}

class _FavoriteTasksState extends State<FavoriteTasks> {
  late List<Task> favoriteTasks;

  @override
  initState() {
    super.initState();
    favoriteTasks = BlocProvider.of<TaskCubit>(context).fetchFavoriteTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.75,
        child: BlocBuilder<TaskCubit, TaskState>(builder: (context, state) {
          if (state is TasksFetched) {
            return ListView.builder(
                //to be assigned to fetched list.size
                itemCount: favoriteTasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return TaskListTile(
                      taskLabel: favoriteTasks[index].taskLabel,
                      isComplete: favoriteTasks[index].isComplete,
                      isFavorite: favoriteTasks[index].isFavorite);
                });
          } else {
            return Center(
              child: Text("You haven't mark any task as favorite yet.",
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
