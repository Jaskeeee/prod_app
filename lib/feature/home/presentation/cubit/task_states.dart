import 'package:prod_app/feature/home/domain/model/task_model.dart';

sealed class TaskStates {}
class TaskInitial extends TaskStates{}
class TaskLoading extends TaskStates{}
class TaskLoaded extends TaskStates{
  Stream<List<TaskModel>> tasks;
  TaskLoaded(this.tasks);
}
class TaskError extends TaskStates{
  final String message;
  TaskError(this.message);
}
