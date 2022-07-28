import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plan_em/Cubits/task_cubit.dart';
import 'package:plan_em/reusable_components/TaskListTile.dart';

import '../../Data models/Task.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({Key? key}) : super(key: key);

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  late List<Task> allTasks;

  @override
  void initState() {
    super.initState();
    allTasks = BlocProvider.of<TaskCubit>(context).fetchAllTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery
            .of(context)
            .size
            .height * 0.75,
        child: BlocBuilder<TaskCubit, TaskState>(
          builder: (context, state) {
            if(state is TasksFetched) {
              return ListView.builder(
                  //to be assigned to fetched list.size
                  itemCount: allTasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TaskListTile(
                        taskLabel: allTasks[index].taskLabel,
                        isComplete: allTasks[index].isComplete,
                        isFavorite: allTasks[index].isFavorite);
                  });
            }
            else{
              return Center(
                child: Text("You haven't created tasks yet.",textAlign: TextAlign.center, style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              );
            }
          },
        ));
  }
}
