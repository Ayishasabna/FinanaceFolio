import 'package:hive/hive.dart';
part 'category_model.g.dart';

@HiveType(typeId: 2)
class CategoryModel extends HiveObject {
  @HiveField(0)
  final String categoryName;
  @HiveField(1)
  final String categoryImage;
  @HiveField(2)
  final bool isDeleted;

  CategoryModel(
      {required this.categoryName,
      required this.categoryImage,
      this.isDeleted = false});
}
