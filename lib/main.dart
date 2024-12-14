import 'dart:io';

import 'package:bloc_planner/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final Directory dir = await getApplicationDocumentsDirectory();

  final db = await Isar.open(
    [TaskIsarSchema],
    directory: dir.path,
  );

  final isarTodoRepo = TaskIsarRepo(db);

  runApp(
    MyApp(
      taskRepo: isarTodoRepo,
    ),
  );
}

class MyApp extends StatelessWidget {
  final TaskRepo taskRepo;

  const MyApp({
    super.key,
    required this.taskRepo,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloc Planner',
      theme: ThemeData.dark(),
      home: BlocProvider(
        create: (_) => TaskCubit(taskRepo),
        child: const TaskScreen(),
      ),
    );
  }
}
