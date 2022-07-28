import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubits/task_cubit.dart';
import '../Data models/Task.dart';
import '../reusable_components/TaskSchedule.dart';

class ScheduleScreen extends StatefulWidget {
  static const String routeName = "/ScheduleScreen";

  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  late List<Task> deadlineTasks;

  @override
  void initState() {
    super.initState();
    //todo: remove dummy date.
    deadlineTasks =
        BlocProvider.of<TaskCubit>(context).fetchTaskByDate("2022-07-28");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          foregroundColor: Colors.black87,
          title: const Text(
            "Schedule",
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              children: [
                //display calender selector
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width,
                ),
                Divider(
                  thickness: 2,
                ),
                //display weekday & date
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sunday",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text("28 Feb, 2021", style: TextStyle(fontSize: 15))
                    ],
                  ),
                ),
                //display list of TaskSchedule tiles
                Expanded(
                  child: BlocBuilder<TaskCubit, TaskState>(
                    builder: (context, state) {
                      return ListView.builder(
                          //to be assigned to fetched list.size
                          itemCount: deadlineTasks.length,
                          itemBuilder: (BuildContext context, int index) {
                            return TaskSchedule(
                              startTime: deadlineTasks[index].startTime!,
                              taskLabel: deadlineTasks[index].taskLabel,
                              isComplete: deadlineTasks[index].isComplete == 1
                                  ? true
                                  : false,
                            );
                          });
                    },
                  ),
                ),
                //todo: fetch data by date and present it
              ],
            ),
          ),
        ));
  }
}
