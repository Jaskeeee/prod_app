import 'package:prod_app/feature/home/domain/model/task_model.dart';

abstract class TaskRepo {
  Stream<List<TaskModel>> getAllTasks(
    String uid,String categoryId
  );
  Future<void> addTask(
    String uid,
    String categoryId,
    String title,
    String occurrence,
    DateTime? deadline,
  );
  Future<void> editTask(
    String uid,
    String categoryId,
    String id,
    String? title,
    String? occurrence,
    DateTime? deadline,
  ); 
  Future<void> deleteTask(
    String uid, 
    String categoryId,
    String id,
  ); 
}