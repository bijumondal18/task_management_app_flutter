import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/bottom_navigation_bar.dart';
import 'package:flutter_todo_app/common/theme.dart';
import 'package:flutter_todo_app/database/question_database.dart';
import 'package:flutter_todo_app/features/task_list/bloc/task_list_bloc.dart';
import 'package:flutter_todo_app/features/task_list/data/questions.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

import 'common/common.dart';

String _boxName = "Questions";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<Questions>(QuestionsAdapter());
  await Hive.openBox<Questions>(_boxName);

  runApp(BlocProvider(
      create: (context) => TaskListBloc(QuestionDatabase()),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.transparent, // status bar color
    ));
    BlocProvider.of<TaskListBloc>(context).add(TaskListInitialEvent());

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Task Management App',
      theme: AppTheme.lightTheme,
      home: const CustomBottomNavigationBar(),
    );
  }
}
