import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  final String id;
  final String title;
  final bool isCompleted;
  final String occurrence;
  final DateTime createdAt;
  final DateTime? deadline;

  TaskModel({
    required this.id,
    required this.title,
    required this.occurrence,
    required this.deadline,
    required this.createdAt,
    this.isCompleted = false
  });

  Map<String,dynamic> toJson(){
    return{
      "id":id,
      "title":title,
      "occurrence":occurrence,
      "deadline":deadline,
      "createdAt":createdAt,
      "isCompleted":isCompleted,
    };
  }

  factory TaskModel.fromJson(Map<String,dynamic> json){
    return TaskModel(
      id: json["id"], 
      title: json["title"], 
      occurrence: json["occurrence"], 
      deadline: json["deadline"]!=null ?(json["deadline"] as Timestamp).toDate() :null,  
      createdAt: (json["createdAt"]as Timestamp).toDate(),
      isCompleted: json["isCompleted"],
    );
  }

  TaskModel toggleCompleted(){
    return TaskModel(
      id: id, 
      title: title, 
      occurrence: occurrence, 
      deadline: deadline , 
      createdAt: createdAt,
      isCompleted: !isCompleted
    );
  }

}