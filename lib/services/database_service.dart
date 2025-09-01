// task_datasource.dart
import 'dart:async';
import 'package:flutter_test_project/models/homework.dart';
import 'package:flutter_test_project/services/storage.dart';

class TaskDatasource {
  static final TaskDatasource _instance = TaskDatasource._();
  factory TaskDatasource() => _instance;
  TaskDatasource._();

  final Storage _storage = Storage();

  /// Добавить задачу; вернёт новый id
  Future<int> addTask(Homework task) async {
    final tasks = await _storage.loadTasks();
    final newId = await _storage.nextTaskId();

    // создаём копию с проставленным id через json — не зависит от наличия copyWith
    final map = Map<String, dynamic>.from(task.toJson());
    map['id'] = newId;
    final newTask = Homework.fromJson(map);

    // кладём в начало, чтобы «id DESC» визуально сохранился
    tasks.insert(0, newTask);
    await _storage.saveTasks(tasks);
    return newId;
  }

  /// Получить все задачи (id DESC для совместимости со старым UI)
  Future<List<Homework>> getAllTasks() async {
    final tasks = await _storage.loadTasks();
    tasks.sort((a, b) => (b.id ?? 0).compareTo(a.id ?? 0));
    return tasks;
  }

  /// Обновить по id; вернёт 1 если обновили, 0 если такой id не найден
  Future<int> updateTask(Homework task) async {
    final tasks = await _storage.loadTasks();
    final idx = tasks.indexWhere((t) => (t.id ?? -1) == task.id);
    if (idx == -1) return 0;
    tasks[idx] = task;
    await _storage.saveTasks(tasks);
    return 1;
  }

  /// Удалить по id; вернёт 1 если удалили, 0 если не нашли
  Future<int> deleteTask(Homework task) async {
    final tasks = await _storage.loadTasks();
    final before = tasks.length;
    tasks.removeWhere((t) => (t.id ?? -1) == task.id);
    final removed = before - tasks.length;
    if (removed > 0) await _storage.saveTasks(tasks);
    return removed;
  }
}
