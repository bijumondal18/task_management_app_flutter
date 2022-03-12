part of 'task_list_bloc.dart';

@immutable
abstract class TaskListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

//initial event
class TaskListInitialEvent extends TaskListEvent {

}

//add event
class TaskListFetchEvent extends TaskListEvent {
  final List<Questions> questions;

  TaskListFetchEvent({required this.questions});

  @override
  List<Object?> get props => [questions];
}

//add event
class TaskListAddEvent extends TaskListEvent {
  final String title;
  final bool isCompleted;
  final String questionNo;

  TaskListAddEvent(this.questionNo, {required this.title, required this.isCompleted});

  @override
  List<Object?> get props => [title, isCompleted];
}

//edit event
class TaskListEditEvent extends TaskListEvent {
  final String title;
  final int index;
  final bool isCompleted;

  TaskListEditEvent(
      {required this.index, required this.title, required this.isCompleted});

  @override
  List<Object?> get props => [index, title, isCompleted];
}

//delete event
class TaskListDeleteEvent extends TaskListEvent {
  final int index;

  TaskListDeleteEvent({required this.index});

  @override
  List<Object?> get props => [index];
}
