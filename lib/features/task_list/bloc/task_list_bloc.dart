import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_todo_app/database/question_database.dart';

import '../data/questions.dart';

part 'task_list_event.dart';

part 'task_list_state.dart';

class TaskListBloc extends Bloc<TaskListEvent, TaskListState> {
  final QuestionDatabase _questionDatabase;
  List<Questions> _questions = [];

  TaskListBloc(this._questionDatabase) : super(TaskListInitial());

  @override
  Stream<TaskListState> mapEventToState(TaskListEvent event) async* {
    if (event is TaskListInitialEvent) {
      yield* _mapInitialEventToState();
    }

    if (event is TaskListAddEvent) {
      yield* _mapTaskListAddEventToState(
          title: event.title, isCompleted: event.isCompleted, questionNo: event.questionNo);
    }
  }


  Stream<TaskListState> _mapInitialEventToState() async* {
    yield TaskListLoadingState();

    await _getQuestions();

    yield TaskListLoadedState(questions: _questions);
  }

  Stream<TaskListState> _mapTaskListAddEventToState(
      {required String title, required bool isCompleted, required String questionNo}) async* {
    yield TaskListLoadingState();

    await _addQuestions(title: title, isCompleted: isCompleted, questionNo: questionNo);

    yield TaskListLoadedState(questions: _questions);
  }

  Future<void> _getQuestions() async {
    await _questionDatabase.getAllTasks().then((value) {
      _questions = value;
    });
  }

  Future<void> _addQuestions(
      {required String title, required bool isCompleted, required String questionNo}) async {
    await _questionDatabase.addToBox(Questions(title, isCompleted, questionNo));
    await _getQuestions();
  }
}
