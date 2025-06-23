import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prod_app/feature/home/domain/model/category_model.dart';
import 'package:prod_app/feature/home/domain/repo/category_repo.dart';

class FirebaseCategoryRepo implements CategoryRepo {
  final _firestore = FirebaseFirestore.instance;
  @override
  Stream<List<CategoryModel>> getAllCategories(String uid) {
    try {
      final CollectionReference categoryRef = _firestore
          .collection("users")
          .doc(uid)
          .collection("categories");
      //offline persistence

      return categoryRef.snapshots().map((snapshot) {
        return snapshot.docs.map((doc) {
          return CategoryModel.fromJson(doc.data() as Map<String, dynamic>);
        }).toList();
      });
    } catch (e) {
      throw Exception("Failed to Fetch to all user Categories: $e");
    }
  }

  @override
  Future<void> addCategories(
    String uid,
    String title,
    String color,
    Map<String, dynamic> icon,
    DateTime? deadline,
    String? note,
    String? noteColor,
  ) async {
    try {
      final CollectionReference categoryCollectionRef = _firestore
          .collection("users")
          .doc(uid)
          .collection("categories");

      final DocumentReference categoryDocRef = categoryCollectionRef.doc();
      CategoryModel category = CategoryModel(
        id: categoryDocRef.id,
        color: color,
        deadline: deadline,
        createdAt: DateTime.now().toUtc(),
        icon: icon,
        title: title,
        value: 0,
        note: note ?? "",
        noteColor: noteColor ?? "",
      );
      await categoryDocRef.set(category.toJson());
    } catch (e) {
      throw Exception("Failed to Create Category: $e");
    }
  }

  @override
  Future<void> editCategory(
    String uid,
    String id,
    String title,
    String color,
    Map<String, dynamic> icon,
    DateTime? deadline,
    String? note,
    String? noteColor,
  ) async {
    try {
      final CollectionReference categoryCollectionRef = _firestore
          .collection("users")
          .doc(uid)
          .collection("categories");
      final DocumentReference categoryDocRef = categoryCollectionRef.doc(id);

      final DocumentSnapshot categoryDocSnap = await categoryDocRef.get();
      final categoryData = categoryDocSnap.data() as Map<String, dynamic>;
      final Map<String, dynamic> updatedData = {
        "title": categoryData["title"] ?? title,
        "color": categoryData["color"] ?? color,
        "icon": categoryData["icon"] ?? icon,
        "deadline": categoryData["deadline"] ?? deadline,
        "note": categoryData['note'] ?? note,
        "noteColor": categoryData["noteColor"] ?? noteColor,
      };
      await categoryDocRef.update(updatedData);
    } catch (e) {
      throw Exception("Failed to update the selected Category: $e");
    }
  }

  @override
  Future<void> deleteCategory(String uid, String id) async {
    try {
      final CollectionReference categoryCollectionRef = _firestore
          .collection("users")
          .doc(uid)
          .collection("categories");

      final DocumentReference categoryDocRef = categoryCollectionRef.doc(id);
      await categoryDocRef.delete();
    } catch (e) {
      throw Exception("Failed to Delete Category:$e");
    }
  }
}
