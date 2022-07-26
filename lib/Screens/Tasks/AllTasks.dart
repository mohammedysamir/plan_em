import 'package:flutter/material.dart';
import 'package:plan_em/reusable_components/TaskListTile.dart';
import 'package:plan_em/reusable_components/PrimaryButton.dart';
import '../../Data models/Task.dart';
import '../TaskCreationScreen.dart';
//todo: create list of listTiles to be viewed and fetched from DB
List<Task> tasks=<Task>[
  Task(taskLabel: "this is task 1",repetition:Repetition.daily,startTime: TimeOfDay.now(),endTime: TimeOfDay.now(),deadline: DateTime.now()),
  Task(taskLabel: "this is task 2",repetition:Repetition.daily,startTime: TimeOfDay.now(),endTime: TimeOfDay.now(),deadline: DateTime.now()),
  Task(taskLabel: "this is task 3",repetition:Repetition.daily,startTime: TimeOfDay.now(),endTime: TimeOfDay.now(),deadline: DateTime.now()),
];
class AllTasks extends StatefulWidget {
  const AllTasks({Key? key}) : super(key: key);

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.75,
      child: ListView.builder(
          //to be assigned to fetched list.size
          itemCount: tasks.length,
          itemBuilder:(BuildContext context,int index){
            return  TaskListTile(taskLabel: tasks[index].taskLabel, isComplete: true, isFavorite: false);
          }
      ),
    );
  }
}
