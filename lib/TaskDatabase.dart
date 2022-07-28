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
            'CREATE TABLE tasks(label TEXT NOT NULL, repetition Text, deadline TEXT, start TEXT, end TEXT, reminder TEXT,isFavorite BOOLEAN, isComplete BOOLEAN)');
      },
    );
  }

  Future<void> insertTask(Task t) async {
    final db = await initiateDatabase();
    await db.insert('tasks', t.toMap());
  }

  Future<List<Task>> getAllTasks() async {
    final db = await initiateDatabase();
    final List<Map<String, Object?>> result = await db.query('tasks');
    return result.map((e) => Task.fromMap(e)).toList();
  }

  Future<List<Task>> getCompletedTasks() async {
    final db = await initiateDatabase();
    final List<Map<String, Object?>> result =
        await db.query('tasks', where: "isComplete =?", whereArgs: ["${1}"]);
    return result.map((e) => Task.fromMap(e)).toList();
  }

  Future<List<Task>> getTasksByDate(String deadline) async {
    final db = await initiateDatabase();
    final List<Map<String, Object?>> result =
        await db.query('tasks', where: "deadline =?", whereArgs: ["${deadline}"]);
    return result.map((e) => Task.fromMap(e)).toList();
  }

  Future<List<Task>> getUncompletedTasks() async {
    final db = await initiateDatabase();
    final List<Map<String, Object?>> result = await db
        .query('tasks', where: "isComplete =?", whereArgs: ["${0}"]);
    return result.map((e) => Task.fromMap(e)).toList();
  }

  Future<List<Task>> getFavoriteTasks() async {
    final db = await initiateDatabase();
    final List<Map<String, Object?>> result =
        await db.query('tasks', where: "isFavorite =?", whereArgs: ["${1}"]);
    return result.map((e) => Task.fromMap(e)).toList();
  }

  Future<int> updateFavoriteTask(Task task, int isFavorite) async {
    final db = await initiateDatabase();
    int result = await db.update('tasks', task.toMap(),
        where: 'isFavorite=?', whereArgs: [isFavorite]);
    return result; //return # updated records
  }

  Future<int> updateCompletedTask(Task task, int isCompleted) async {
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
