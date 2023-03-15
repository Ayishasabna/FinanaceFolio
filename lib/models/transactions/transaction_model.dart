import 'package:hive/hive.dart';
import 'package:spendee/models/category/category_model.dart';
part 'transaction_model.g.dart';

@HiveType(typeId: 1)
class TransactionModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String explain;
  @HiveField(2)
  String amount;
  @HiveField(3)
  String IN;
  @HiveField(4)
  DateTime datetime;

  TransactionModel(
    this.IN,
    this.amount,
    this.datetime,
    this.explain,
    this.name,
  );
}
