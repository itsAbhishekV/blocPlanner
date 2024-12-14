import 'package:bloc_planner/exports.dart';
import 'package:isar/isar.dart';

// Model for the Isar DB

part 'task_isar.g.dart';

@collection
class TaskIsar {
  Id id = Isar.autoIncrement;
  late String task;
  late bool isDone;

  Task toTask() {
    return Task(
      id: id,
      task: task,
      isDone: isDone,
    );
  }

  static TaskIsar fromTask(Task task) {
    return TaskIsar()
      ..id = task.id
      ..task = task.task
      ..isDone = task.isDone;
  }
}
