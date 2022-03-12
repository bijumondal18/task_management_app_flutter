part of 'task_list_bloc.dart';

@immutable
abstract class TaskListState extends Equatable {

}

//initial state
class TaskListInitial extends TaskListState {
  @override
  List<Object?> get props => [];
}

//loading state
class TaskListLoadingState extends TaskListState {
  @override
  List<Object?> get props => [];
}

//edit state
class TaskListEditState extends TaskListState {
  final Questions questions;

  TaskListEditState({required this.questions});
  @override
  List<Object?> get props => [questions];
}

//all questions loaded state
class TaskListLoadedState extends TaskListState {
  final List<Questions>? questions;

  TaskListLoadedState({this.questions});
  @override
  List<Object?> get props => [questions];
}

//failed state
class TaskListFailedState extends TaskListState {
  final String errorMessage;

  TaskListFailedState({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}