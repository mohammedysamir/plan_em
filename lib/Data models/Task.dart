import '../reusable_components/Constants.dart';

class Task {
  final String taskLabel;
  final String? repetition, reminder,startTime,endTime,deadline;
  final bool isFavorite, isComplete;

  const Task(
      {required this.taskLabel,
      required this.isFavorite,
      required this.isComplete,
      this.repetition,
      this.startTime,
      this.endTime,
      this.deadline,
      this.reminder});
}
