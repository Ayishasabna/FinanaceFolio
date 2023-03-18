import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:spendee/db/category_db.dart';
import 'package:spendee/db/transaction_db.dart';
import 'package:spendee/models/category/category_model.dart';

import 'package:spendee/models/transactions/transaction_model.dart';

int totals = 0;
final transactionDB = Hive.box<TransactionModel>(transactionDBName);
//final transactionDB1=Hive.openBox<TransactionModel>('data');
final categoryDB = Hive.box<CategoryModel>(categoryDBName);

int total() {
  //var history2=
  var history2 = transactionDB.values.toList();
  List a = [0, 0];
  for (var i = 0; i < history2.length; i++) {
    a.add(history2[i].finanace == 'income'
        ? int.parse(history2[i].amount)
        : int.parse(history2[i].amount) * -1);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}

int income() {
  var history2 = transactionDB.values.toList();
  List a = [0, 0];
  for (var i = 0; i < history2.length; i++) {
    a.add(history2[i].finanace == 'income' ? int.parse(history2[i].amount) : 0);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}

int expense() {
  var history2 = transactionDB.values.toList();
  List a = [0, 0];
  for (var i = 0; i < history2.length; i++) {
    a.add(history2[i].finanace == 'income'
        ? 0
        : int.parse(history2[i].amount) * -1);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}

List<TransactionModel> today() {
  List<TransactionModel> a = [];
  var history2 = transactionDB.values.toList();
  var model2 = categoryDB.values.toList();
  DateTime date = new DateTime.now();
  for (var i = 0; i < history2.length; i++) {
    if (history2[i].datetime.day == date.day) {
      a.add(history2[i]);
    }
  }
  return a;
}

List<TransactionModel> week() {
  List<TransactionModel> a = [];
  var history2 = transactionDB.values.toList();
  var model2 = categoryDB.values.toList();
  DateTime date = new DateTime.now();

  return a;
}

List<TransactionModel> month() {
  List<TransactionModel> a = [];
  var history2 = transactionDB.values.toList();
  var model2 = categoryDB.values.toList();
  DateTime date = new DateTime.now();

  return a;
}

List<TransactionModel> year() {
  List<TransactionModel> a = [];
  var history2 = transactionDB.values.toList();
  var model2 = categoryDB.values.toList();
  DateTime date = new DateTime.now();

  return a;
}

int total_chart(List<TransactionModel> history2) {
  List a = [0, 0];

  return totals;
}

List time(List<TransactionModel> history2, bool hour) {
  List<TransactionModel> a = [];
  List total = [0, 0];

  return total;
}
