// this file cares about the operations that the app can do.
// doesn't care about the implementation of the operations.

import 'package:bloc_planner/exports.dart';

abstract class TaskRepo {
  Future<List<Task>> getTasks();

  Future<void> addTask(Task newTask);

  Future<void> updateTask(Task task);

  Future<void> deleteTask(Task task);
}
