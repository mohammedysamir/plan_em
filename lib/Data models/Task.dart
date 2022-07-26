import '../reusable_components/Constants.dart';

class Task {
  final String taskLabel;
  final Repetition? repetition;
  final String? reminder,startTime,endTime,deadline;
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
