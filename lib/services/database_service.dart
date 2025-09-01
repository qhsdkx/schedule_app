import 'dart:async';
import 'package:flutter_test_project/models/homework.dart';
import 'package:flutter_test_project/services/storage.dart';

class TaskDatasource {
  static final TaskDatasource _instance = TaskDatasource._();
  factory TaskDatasource() => _instance;
  TaskDatasource._();

  final Storage _storage = Storage();

  Future<int> addTask(Homework task) async {
    final tasks = await _storage.loadTasks();
    final newId = await _storage.nextTaskId();

    final map = Map<String, dynamic>.from(task.toJson());
    map['id'] = newId;
    final newTask = Homework.fromJson(map);

    tasks.insert(0, newTask);
    await _storage.saveTasks(tasks);
    return newId;
  }

  Future<List<Homework>> getAllTasks() async {
    final tasks = await _storage.loadTasks();
    tasks.sort((a, b) => (b.id ?? 0).compareTo(a.id ?? 0));
    return tasks;
  }

  Future<int> updateTask(Homework task) async {
    final tasks = await _storage.loadTasks();
    final idx = tasks.indexWhere((t) => (t.id ?? -1) == task.id);
    if (idx == -1) return 0;
    tasks[idx] = task;
    await _storage.saveTasks(tasks);
    return 1;
  }

  Future<int> deleteTask(Homework task) async {
    final tasks = await _storage.loadTasks();
    final before = tasks.length;
    tasks.removeWhere((t) => (t.id ?? -1) == task.id);
    final removed = before - tasks.length;
    if (removed > 0) await _storage.saveTasks(tasks);
    return removed;
  }
}
