import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prod_app/feature/home/domain/model/task_model.dart';
import 'package:prod_app/feature/home/domain/repo/task_repo.dart';

class FirebaseTaskRepo implements TaskRepo{
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Stream<List<TaskModel>> getAllTasks(String uid, String categoryId){
    try{
      final CollectionReference taskCollection = _firebaseFirestore
        .collection("users").doc(uid)
        .collection("categories").doc(categoryId)
        .collection("tasks");
        return taskCollection.snapshots().map((snapshot){
            return snapshot.docs.map((doc){
              return TaskModel.fromJson(doc.data() as Map<String,dynamic>);
            }).toList();
          }
        ); 
    }
    catch(e){
      throw Exception("Failed to fetch the task from the Category: $e");
    }
  }

  @override
  Future<void> addTask(String uid, String categoryId, String title, String occurrence, DateTime? deadline)async{
    try{
      final CollectionReference taskCollection = _firebaseFirestore
        .collection("users").doc(uid)
        .collection("categories").doc(categoryId)
        .collection("tasks");

      final DocumentReference taskRef= taskCollection.doc();
      TaskModel taskModel = TaskModel(
        id: taskRef.id, 
        title: title, 
        occurrence: occurrence, 
        deadline: deadline, 
        createdAt: DateTime.now().toUtc()
      );
      await taskRef.set(taskModel.toJson());
    }
    catch(e){
      throw Exception("Failed to Add Task to Category :$e");
    }
  }
  
  @override
  Future<void> editTask(String uid, String categoryId, String id, String? title, String? occurrence, DateTime? deadline)async{
    try{
      final CollectionReference taskCollection = _firebaseFirestore
        .collection("users").doc(uid)
        .collection("categories").doc(categoryId)
        .collection(categoryId);

      final DocumentReference taskRef = taskCollection.doc(id);
      final DocumentSnapshot taskDocSnap = await taskRef.get();
      final taskData= taskDocSnap.data as Map<String,dynamic>;
      final Map<String,dynamic> updatedData = {
        "title":taskData["title"] ?? title,
        "occurrence": taskData["occurrence"] ?? occurrence,
        "deadline": taskData["deadline"] ?? deadline
      };
      await taskRef.update(updatedData);
    }
    catch(e){
      throw Exception("Failed to Edit Task to Category :$e");
    }
  }
 
  @override
  Future<void> deleteTask(String uid, String categoryId, String id)async{
    try{
      final CollectionReference taskCollection = _firebaseFirestore
        .collection("users").doc(uid)
        .collection("categories").doc(categoryId)
        .collection(categoryId);
      
      final DocumentReference taskRef = taskCollection.doc(id);
      await taskRef.delete();
    }
    catch(e){
      throw Exception("Failed to Delete Task from the Category: $e");
    }
  }
}