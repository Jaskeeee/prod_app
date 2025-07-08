
import 'package:prod_app/feature/home/domain/model/category_model.dart';

abstract class CategoryRepo {
  Stream<List<CategoryModel>> getAllCategories(String uid);
  Future<void> addCategories(
    String uid,
    String title,
    String color,
    Map<String,dynamic> icon,
    DateTime? deadline,
    String? note,
    String? noteColor,
  );

  Future<void> editCategory(
    String uid,
    String id,
    String title,
    String color,
    Map<String,dynamic> icon,
    DateTime? deadline,
    String? note,
    String? noteColor
  );
  Future<void> deleteCategory(String uid,String id);
}