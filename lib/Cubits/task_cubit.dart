import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:plan_em/TaskDatabase.dart';

import '../Data models/Task.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  late Task task;
  late TaskDatabase databaseHandler;

  TaskCubit() : super(TaskInitial()) {
    databaseHandler = TaskDatabase();
    databaseHandler.initiateDatabase();
  }

  void createTask(Task task){
    databaseHandler.insertTask(task);
    emit(TaskCreated(task));
    print("Cubit: Task created");
  }

//todo: test emits
  List<Task> fetchAllTasks() {
    List<Task> t = <Task>[];
    databaseHandler.getAllTasks().then((tasks) => {
          emit(TasksFetched(tasks)),
          t = tasks,
        });
    print("Cubit: fetch all tasks");
    return t;
  }

  List<Task> fetchCompletedTasks() {
    List<Task> t = <Task>[];
    databaseHandler.getCompletedTasks().then((tasks) => {
          emit(TasksFetched(tasks)),
          t = tasks,
        });
    print("Cubit: fetch Completed tasks");
    return t;
  }

  List<Task> fetchUncompletedTasks() {
    List<Task> t = <Task>[];
    databaseHandler.getUncompletedTasks().then((tasks) => {
          emit(TasksFetched(tasks)),
          t = tasks,
        });
    print("Cubit: fetch Uncompleted tasks");
    return t;
  }

  List<Task> fetchFavoriteTasks() {
    List<Task> t = <Task>[];
    databaseHandler.getFavoriteTasks().then((tasks) => {
          emit(TasksFetched(tasks)),
          t = tasks,
        });
    print("Cubit: fetch Favorite tasks");
    return t;
  }

  void markIsCompleted(Task task, int isCompleted) {
    databaseHandler.updateCompletedTask(task, isCompleted);
    print("Cubit: mark Completed/Uncompleted tasks");
    if (isCompleted==1)
      emit(TaskCompleted(task));
    else
      emit(TaskUncompleted(task));
  }

  void markIsFavorite(Task task, int isFavorite) {
    databaseHandler.updateFavoriteTask(task, isFavorite);
    print("Cubit: fetch favorite/non-favorite tasks");
    if (isFavorite==1)
      emit(TaskFavorite(task));
    else
      emit(TaskNotFavorite(task));
  }

  void deleteTask(Task task) {
    print("Cubit: delete tasks");
    databaseHandler.deleteTask(task.taskLabel).then((value) => {
          emit(TaskDeleted(task)),
        });
  }
}
