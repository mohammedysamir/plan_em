part of 'task_cubit.dart';

@immutable
abstract class TaskState {}

class TaskInitial extends TaskState {}
class TaskCreated extends TaskState {
  final Task task;
  TaskCreated(this.task);
}
class TaskCompleted extends TaskState {
  final Task task;
  TaskCompleted(this.task);
}
class TaskUncompleted extends TaskState {
  final Task task;
  TaskUncompleted(this.task);
}
class TaskFavorite extends TaskState {
  final Task task;
  TaskFavorite(this.task);
}
class TaskNotFavorite extends TaskState {
  final Task task;
  TaskNotFavorite(this.task);
}
class TaskDeleted extends TaskState {
  final Task task;
  TaskDeleted(this.task);
}
class TasksFetched extends TaskState {
  late List<Task> tasks;
  TasksFetched(this.tasks);
}
