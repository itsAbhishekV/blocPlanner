import 'package:bloc_planner/exports.dart';
import 'package:isar/isar.dart';

class TaskIsarRepo implements TaskRepo {
  final Isar db;

  TaskIsarRepo(this.db);

  @override
  Future<void> addTask(Task newTask) async {
    //converting to isar task
    final taskIsar = TaskIsar.fromTask(newTask);

    //adding to isar (read-write transaction)
    return db.writeTxn(
      () => db.taskIsars.put(taskIsar),
    );
  }

  @override
  Future<void> deleteTask(Task task) {
    //deleting task isar (read-write transaction)
    return db.writeTxn(
      () => db.taskIsars.delete(task.id),
    );
  }

  @override
  Future<List<Task>> getTasks() async {
    //getting all tasks from isar
    final tasks = await db.taskIsars.where().findAll();

    //converting to task
    return tasks.map((task) => task.toTask()).toList();
  }

  @override
  Future<void> updateTask(Task task) {
    //converting to isar task
    final taskIsar = TaskIsar.fromTask(task);

    //updating to isar (read-write transaction)
    return db.writeTxn(
      () => db.taskIsars.put(taskIsar),
    );
  }
}
