import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_with_alarm/models/task_model.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._instance();
  static Database _db;

  DBHelper._instance();

  String tasksTable = 'tasker__tasks_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDate = 'date';
  String colPriority = 'priority';
  String colStatus = 'status';
  String colHidden = 'hidden';

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDb();
    }
    return _db;
  }

  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + '/tasker.db';
    final todoListDb = await openDatabase(path,
        version: 3, onCreate: _createDB, onUpgrade: _onUpgradeDB);
    return todoListDb;
  }

  void _createDB(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $tasksTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, $colDate TEXT, $colPriority TEXT, $colStatus INTEGER, $colHidden INTEGER)');
  }

  void _onUpgradeDB(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
      await db.execute(
          'ALTER TABLE $tasksTable ADD COLUMN $colHidden INTEGER DEFAULT 0 NOT NULL');
    }
  }

  Future<List<Map<String, dynamic>>> getTaskMapList(int hidden) async {
    Database db = await this.db;
    final List<Map<String, dynamic>> result = await db
        .query(tasksTable, where: '$colHidden = ?', whereArgs: [hidden]);
    return result;
  }

  Future<List<Task>> getTaskList(int hidden) async {
    final List<Map<String, dynamic>> taskMapList = await getTaskMapList(hidden);
    final List<Task> taskList = [];
    taskMapList.forEach((taskMap) {
      taskList.add(Task.fromMap(taskMap));
    });
    taskList.sort((taskA, taskB) => taskA.date.compareTo(taskB.date));

    return taskList;
  }

  Future<int> insertTask(Task task) async {
    Database db = await this.db;
    final int result = await db.insert(tasksTable, task.toMap());
    return result;
  }

  Future<int> updateTask(Task task) async {
    Database db = await this.db;
    final int result = await db.update(
      tasksTable,
      task.toMap(),
      where: '$colId = ?',
      whereArgs: [task.id],
    );
    return result;
  }

  Future<int> deleteTask(int id) async {
    Database db = await this.db;
    final int result = await db.delete(
      tasksTable,
      where: '$colId = ?',
      whereArgs: [id],
    );
    return result;
  }
}
