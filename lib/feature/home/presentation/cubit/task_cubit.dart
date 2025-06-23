import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prod_app/feature/home/data/firebase_task_repo.dart';
import 'package:prod_app/feature/home/domain/model/task_model.dart';
import 'package:prod_app/feature/home/presentation/cubit/task_states.dart';

class TaskCubit extends Cubit<TaskStates>{
  final FirebaseTaskRepo firebaseTaskRepo;
  TaskCubit({
    required this.firebaseTaskRepo
  }):super(TaskInitial());

  void fetchTasks(String uid,String categoryId){
    emit(TaskLoading());
    try{
      final Stream<List<TaskModel>> tasks = firebaseTaskRepo.getAllTasks(uid, categoryId);
      emit(TaskLoaded(tasks));
    }
    catch(e){
      emit(TaskError(e.toString()));
    }
  }

}