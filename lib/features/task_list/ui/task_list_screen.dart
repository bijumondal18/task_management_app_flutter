import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/common/common.dart';
import 'package:flutter_todo_app/common/widgets/custom_app_bar.dart';

import '../bloc/task_list_bloc.dart';
import '../data/questions.dart';

class TaskListScreen extends StatefulWidget {
  final Questions? questions;

  const TaskListScreen({Key? key, this.questions}) : super(key: key);

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      appBar: const CustomAppBar(title: 'Task List'),
      body: BlocBuilder<TaskListBloc, TaskListState>(
        builder: (context, state) {
          if (state is TaskListInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TaskListLoadedState) {
            return TaskList(state: state);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  final TaskListLoadedState? state;

  TaskList({this.state});

  @override
  Widget build(BuildContext context) {
    bool _value = false;
    int val = -1;

    return ListView.builder(
        itemCount: state!.questions!.length,
        itemBuilder: (context, index) {
          final questions = state!.questions![index];
          return Container(
            margin: const EdgeInsets.all(AppSizes.padding12),
            padding: const EdgeInsets.all(AppSizes.padding12),
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(2, 2),
                    blurRadius: 12,
                    color: Color.fromRGBO(0, 0, 0, 0.14),
                  )
                ],
                color: AppColors.white,
                borderRadius: BorderRadius.all(
                    Radius.circular(AppSizes.cardCornerRadius))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Q-${questions.questionNo}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                      fontSize: AppSizes.font16),
                ),
                const SizedBox(height: AppSizes.padding4),
                Text(
                  questions.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                      fontSize: AppSizes.font14),
                ),
                const SizedBox(height: AppSizes.padding8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: const Text('Yes'),
                        value: _value,
                        groupValue: val,
                        onChanged: (value) {},
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: const Text('No'),
                        value: _value,
                        groupValue: val,
                        onChanged: (value) {},
                      ),
                    ),
                    const Expanded(child: SizedBox())
                  ],
                )
              ],
            ),
          );
          //ListTile(title: Text(questions.title));
        });
  }
}