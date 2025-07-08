import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  
  final String id;
  final String title;
  final String color;
  final Map<String, dynamic> icon;
  final DateTime createdAt;
  final DateTime? deadline;
  final int value;
  final String? note;
  final String? noteColor;

  CategoryModel({
    required this.id, 
    required this.color,
    required this.deadline,
    required this.createdAt,
    required this.icon,
    required this.title,
    required this.value,
    required this.note,
    required this.noteColor
  });

  Map<String,dynamic> toJson(){
    return{
      "id":id,
      "color":color,
      "deadline":deadline,
      "createdAt":createdAt,
      "title":title,
      "value":value,
      "icon":icon,
      "note":note,
      "noteColor":noteColor
    };
  }

  factory CategoryModel.fromJson(Map<String,dynamic> json){
    return CategoryModel(
      id: json["id"], 
      color: json["color"], 
      deadline:json["deadline"] !=null
      ?(json["deadline"] as Timestamp).toDate() 
      :null,
      createdAt: (json["createdAt"] as Timestamp).toDate(), 
      icon: json["icon"], 
      title: json["title"], 
      value: json["value"],
      note: json["note"],
      noteColor: json["noteColor"]
    );      
  }
  
}