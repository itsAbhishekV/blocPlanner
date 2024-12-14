import 'package:bloc_planner/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20.0,
        ),
        child: SafeArea(
          child: BlocBuilder<TaskCubit, List<Task>>(
            builder: (
              context,
              taskList,
            ) {
              return const Text('Task Screen');
            },
          ),
        ),
      ),
    );
  }
}
