import 'package:plan_em/Data models/Task.dart';
import 'package:sqflite/sqflite.dart';

class TaskDatabase {
  final int version = 1;
  static final TaskDatabase instance = TaskDatabase._internal();
  late Database? database = null;
//clean below function
  Future<Database?> get _database async {
    if (database != null) return database;
    database = await initiateDatabase();
    return database;
  }

  factory TaskDatabase() {
    return instance;
  }

  TaskDatabase._internal();

  String getDatabasePath() {
    return getDatabasePath() + '/plan_em.db';
  }

  Future<Database> initiateDatabase() async {
    return await openDatabase(
      getDatabasePath(),
      version: this.version,
      onCreate: (db, version) async {
        //todo: test creating table query and match it with task.dart
        await db.execute(
            'CREATE TABLE tasks(label TEXT, repetition Text, deadline TEXT, start TEXT, end TEXT, reminder TEXT,isFavorite BOOLEAN, isComplete BOOLEAN)');
      },
    );
  }

  Future<void> insertTask(Task t) async {
    await database?.rawInsert(
        "INSERT INTO tasks(label, repetition, deadline, start, end, reminder, isFavorite,isComplete) VALUES("
        "$t.taskLabel, ${t.repetition.toString()},${t.deadline.toString()},${t.startTime.toString()},${t.endTime.toString()},${t.reminder.toString()},${t.isFavorite},${t.isComplete})");
  }

  //
  // void InsertCompletedTask(Task t) async {
  //   await database?.rawInsert(
  //       "INSERT INTO tasks(label, repetition, deadline, start, end, reminder, isFavorite,isComplete) VALUES("
  //       "$t.taskLabel, ${t.repetition.toString()},${t.deadline.toString()},${t.startTime.toString()},${t.endTime.toString()},${t.reminder.toString()},${t.isFavorite},${true})");
  // }
  //
  // void InsertFavoriteTask(Task t) async {
  //   await database?.rawInsert(
  //       "INSERT INTO tasks(label, repetition, deadline, start, end, reminder, isFavorite,isComplete) VALUES("
  //       "$t.taskLabel, ${t.repetition.toString()},${t.deadline.toString()},${t.startTime.toString()},${t.endTime.toString()},${t.reminder.toString()},${true},${t.isComplete})");
  // }

  void getAllTasks() async {
    await database?.rawQuery("SELECT * from tasks");
  }

  void getCompletedTasks() async {
    await database?.rawQuery("SELECT * from tasks where isComplete = ${true}");
  }

  void getUncompletedTasks() async {
    await database?.rawQuery("SELECT * from tasks where isComplete = ${false}");
  }

  void getFavoriteTasks() async {
    await database?.rawQuery("SELECT * from tasks where isFavorite = ${true}");
  }

  void updateFavoriteTask(String taskLabel, bool isFavorite) async {
    await database?.rawUpdate("UPDATE tasks SET isFavorite = ? WHERE label = ?",
        [isFavorite, taskLabel]);
  }

  void updateCompletedTask(String taskLabel, bool isCompleted) async {
    await database?.rawUpdate("UPDATE tasks SET isComplete = ? WHERE label = ?",
        [isCompleted, taskLabel]);
  }

  void deleteTask(String taskLabel) async {
    await database?.rawDelete('DELETE FROM tasks WHERE label = ?', [taskLabel]);
  }
}
//todo: test database functionalities
