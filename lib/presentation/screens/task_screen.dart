import 'package:bloc_planner/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  void showAddTaskBottomSheet(BuildContext context) {
    final taskCubit = context.read<TaskCubit>();
    final taskController = TextEditingController();

    showModalBottomSheet(
      useSafeArea: true,
      showDragHandle: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 32.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: taskController,
                decoration: InputDecoration(
                  hintText: 'Add task here',
                  hintStyle: const TextStyle(color: Colors.grey),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 20.0,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1.7,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2.2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      taskController.clear();
                      Navigator.pop(context);
                      setState(() {});
                    },
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 16.0),
                  TextButton(
                    onPressed: () {
                      taskCubit.addTask(taskController.text);
                      Navigator.pop(context);
                      setState(() {});
                    },
                    child: const Text('Add'),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final taskCubit = context.read<TaskCubit>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 32.0,
        ),
        onPressed: () {
          showAddTaskBottomSheet(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 12.0,
        ),
        child: BlocBuilder<TaskCubit, List<Task>>(
          builder: (
            context,
            tasks,
          ) {
            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (BuildContext context, int index) {
                final task = tasks[index];

                return ListTile(
                  title: Text(
                    task.task,
                    style: TextStyle(
                      decoration: task.isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      taskCubit.deleteTask(task);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 20.0,
                    ),
                  ),
                  leading: Checkbox(
                      value: task.isDone,
                      onChanged: (value) {
                        taskCubit.toggleDone(task);
                      }),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
