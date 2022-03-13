import 'package:flutter/material.dart';
import '../../../widgets/widgets.dart';

class TaskHistoryScreen extends StatefulWidget {
  const TaskHistoryScreen({Key? key}) : super(key: key);

  @override
  State<TaskHistoryScreen> createState() => _TaskHistoryScreenState();
}

class _TaskHistoryScreenState extends State<TaskHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Task History'),
    );
  }
}
