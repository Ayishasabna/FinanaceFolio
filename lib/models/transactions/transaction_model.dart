import 'package:hive/hive.dart';
import 'package:spendee/models/category/category_model.dart';
part 'transaction_model.g.dart';

@HiveType(typeId: 1)
class TransactionModel extends HiveObject {
  @HiveField(0)
  CategoryModel category;
  //String categoryName;
  @HiveField(1)
  String explain;
  @HiveField(2)
  String amount;
  @HiveField(3)
  String finanace;
  @HiveField(4)
  DateTime datetime;
  @HiveField(5)
  String id;
  /*  @HiveField(6)
  CategoryModel category; */

  TransactionModel(
      {required this.finanace,
      required this.amount,
      required this.datetime,
      required this.explain,
      //required this.categoryName,
      required this.id,
      required this.category});

  get int => null;
}
