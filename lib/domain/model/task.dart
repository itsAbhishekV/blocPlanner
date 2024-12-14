class Task {
  final int id;
  final String task;
  final bool isDone;

  Task({
    required this.id,
    required this.task,
    this.isDone = false,
  });

  Task toggleDone() {
    return Task(
      id: id,
      task: task,
      isDone: !isDone,
    );
  }
}
