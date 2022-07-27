import 'package:flutter/material.dart';

import '../reusable_components/TaskSchedule.dart';

List<TaskSchedule> tasks = [
  TaskSchedule(
      taskLabel: "Design team meeting", startTime: "9:00 AM", isComplete: true),
  TaskSchedule(
      taskLabel: "Making wireframes", startTime: "11:00 AM", isComplete: false),
  TaskSchedule(
      taskLabel: "Check emails", startTime: "13:00 PM", isComplete: false),
  TaskSchedule(
      taskLabel: "Meeting with Murman",
      startTime: "13:30 PM",
      isComplete: false),
];
//todo: remove dummy data and replace it with db tasks based on selected date, solve scrollable issue

class ScheduleScreen extends StatefulWidget {
  static const String routeName = "/ScheduleScreen";

  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
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
                  color: Colors.amber,
                  child: Text("THIS IS CALENDER"),
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
                  child: ListView.builder(
                      //to be assigned to fetched list.size
                      itemCount: tasks.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TaskSchedule(
                          startTime: tasks[index].startTime,
                          taskLabel: tasks[index].taskLabel,
                          isComplete: tasks[index].isComplete,
                        );
                      }),
                ),
                //todo: fetch data by date and present it
              ],
            ),
          ),
        ));
  }
}
