import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plan_em/Cubits/task_cubit.dart';
import 'package:plan_em/reusable_components/CustomDropDownList.dart';

import '../Data models/Task.dart';
import '../reusable_components/Constants.dart';
import '../reusable_components/DateTimeSelector.dart';
import '../reusable_components/InputFieldWithLabel.dart';
import '../reusable_components/PrimaryButton.dart';

class TaskCreationScreen extends StatefulWidget {
  static const String routeName = "/TaskCreationScreen";

  const TaskCreationScreen({Key? key}) : super(key: key);

  @override
  State<TaskCreationScreen> createState() => _TaskCreationScreenState();
}

class _TaskCreationScreenState extends State<TaskCreationScreen> {
  var taskLabelController = TextEditingController();
  var taskStartTimeController = TextEditingController();
  var taskEndTimeController = TextEditingController();
  var taskDeadLineController = TextEditingController();
  var taskRepetitionController = TextEditingController();
  var taskReminderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //set initial values
    taskReminderController.text = Reminder[0];
    taskRepetitionController.text = Repetition[0];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        foregroundColor: Colors.black87,
        title: const Text(
          "Add Task",
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
        height: MediaQuery.of(context).size.height * 0.87,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //form
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InputFieldWithLabel(
                    label: "Title",
                    hint: "Finish to-do app implementation",
                    width: 300,
                    controller: taskLabelController,
                    context: context),
                DateTimeSelector(
                    label: "Deadline",
                    hint: "2021-02-22",
                    width: 400,
                    isDatePicker: true,
                    context: context,
                    controller: taskDeadLineController),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: DateTimeSelector(
                          label: "Start time",
                          hint: "start time",
                          width: 170,
                          isDatePicker: false,
                          context: context,
                          controller: taskStartTimeController),
                    ),
                    Expanded(
                      child: DateTimeSelector(
                          label: "End time",
                          hint: "end time",
                          width: 170,
                          isDatePicker: false,
                          context: context,
                          controller: taskEndTimeController),
                    )
                  ],
                ),
                //Reminder selector
                CustomDropDownList(
                  label: "Remind",
                  context: context,
                  width: 400,
                  items: Reminder,
                  controller: taskReminderController,
                ),
                //Repetition selector
                CustomDropDownList(
                  label: "Repetition",
                  context: context,
                  width: 400,
                  items: Repetition,
                  controller: taskRepetitionController,
                ),
              ],
            ),
            PrimaryButton(
                label: "Create a Task",
                onPressedFunction: () {
                  //create new task
                  Task t = new Task(
                      taskLabel: taskLabelController.text,
                      isComplete: 0,
                      isFavorite: 0,
                      deadline: taskDeadLineController.text,
                      startTime: taskStartTimeController.text,
                      endTime: taskEndTimeController.text,
                      repetition: taskRepetitionController.text,
                      reminder: taskReminderController.text);
                  //insert new task
                  BlocProvider.of<TaskCubit>(context).createTask(t);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Task has been created successfully'),
                  ));
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
//todo: add validation on start/end time and title must be exist
