import 'package:bloc_planner/exports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskCubit extends Cubit<List<Task>> {
  final TaskRepo _taskRepo;

  TaskCubit(this._taskRepo) : super([]) {
    loadTasks();
  }

  Future<void> loadTasks() async {
    final tasks = await _taskRepo.getTasks();
    emit(tasks);
  }

  Future<void> addTask(String task) async {
    final newTask = Task(
      id: DateTime.now().millisecondsSinceEpoch,
      task: task,
    );

    await _taskRepo.addTask(newTask);

    loadTasks();
  }

  Future<void> deleteTask(Task task) async {
    await _taskRepo.deleteTask(task);

    loadTasks();
  }

  Future<void> updateTask(Task task) async {
    await _taskRepo.updateTask(task);

    loadTasks();
  }

  Future<void> toggleDone(Task task) async {
    final updateTask = task.toggleDone();

    await _taskRepo.updateTask(updateTask);

    loadTasks();
  }
}
