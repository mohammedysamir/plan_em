class Task {
  final String taskLabel;
  final String? repetition, reminder,startTime,endTime,deadline;
  final int isFavorite, isComplete;

  const Task(
      {required this.taskLabel,
      required this.isFavorite,
      required this.isComplete,
      this.repetition,
      this.startTime,
      this.endTime,
      this.deadline,
      this.reminder});

  Task.fromMap(Map<String, dynamic> res)
      : taskLabel = res["label"],
        isFavorite = res["isFavorite"],
        isComplete = res["isComplete"],
        repetition = res["repetition"],
        startTime = res["start"],
        endTime = res["end"],
        deadline = res["deadline"],
        reminder = res["reminder"];

  Map<String, Object?> toMap() {
    return {'label':taskLabel,'isFavorite': isFavorite, 'isComplete': isComplete, 'repetition': repetition, 'start': startTime, 'end':endTime,'deadline':deadline, 'reminder':reminder};
  }
}
