import 'package:path/path.dart';
import 'package:plan_em/Data models/Task.dart';
import 'package:sqflite/sqflite.dart';

class TaskDatabase {
  final int version = 1;

  Future<Database> initiateDatabase() async {
    String dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'plan_em.db'),
      version: this.version,
      onCreate: (db, version) async {
        //todo: test creating table query and match it with task.dart
        await db.execute(
            'CREATE TABLE tasks(label TEXT, repetition Text, deadline TEXT, start TEXT, end TEXT, reminder TEXT,isFavorite BOOLEAN, isComplete BOOLEAN)');
      },
    );
  }

  Future<void> insertTask(Task t) async {
    final db = await initiateDatabase();
    await db.insert('tasks', t.toMap());
    // "INSERT INTO tasks(label, repetition, deadline, start, end, reminder, isFavorite,isComplete) VALUES("
    // "$t.taskLabel, ${t.repetition.toString()},${t.deadline.toString()},${t.startTime.toString()},${t.endTime.toString()},${t.reminder.toString()},${t.isFavorite},${t.isComplete})");
  }

  Future<List<Task>> getAllTasks() async {
    final db = await initiateDatabase();
    final List<Map<String, Object?>> result = await db.query('tasks');
    return result.map((e) => Task.fromMap(e)).toList();
  }

  Future<List<Task>> getCompletedTasks() async {
    final db = await initiateDatabase();
    final List<Map<String, Object?>> result =
        await db.query('tasks', where: "isComplete =?", whereArgs: ["${true}"]);
    return result.map((e) => Task.fromMap(e)).toList();
    // await database?.rawQuery("SELECT * from tasks where isComplete = ${true}");
  }

  Future<List<Task>> getUncompletedTasks() async {
    final db = await initiateDatabase();
    final List<Map<String, Object?>> result = await db
        .query('tasks', where: "isComplete =?", whereArgs: ["${false}"]);
    return result.map((e) => Task.fromMap(e)).toList();
  }

  Future<List<Task>> getFavoriteTasks() async {
    final db = await initiateDatabase();
    final List<Map<String, Object?>> result =
        await db.query('tasks', where: "isFavorite =?", whereArgs: ["${true}"]);
    return result.map((e) => Task.fromMap(e)).toList();
  }

  Future<int> updateFavoriteTask(Task task, bool isFavorite) async {
    final db = await initiateDatabase();
    int result = await db.update('tasks', task.toMap(),
        where: 'isFavorite=?', whereArgs: [isFavorite]);
    return result; //return # updated records
  }

  Future<int> updateCompletedTask(Task task, bool isCompleted) async {
    final db = await initiateDatabase();
    int result = await db.update('tasks', task.toMap(),
        where: 'isComplete=?', whereArgs: [isCompleted]);
    return result; //return # updated records
  }

  Future<int> deleteTask(String taskLabel) async {
    final db = await initiateDatabase();
    int result =
        await db.rawDelete('DELETE FROM tasks WHERE label = ?', [taskLabel]);
    return result; //return # deleted tasks
  }
}
//todo: test database functionalities
