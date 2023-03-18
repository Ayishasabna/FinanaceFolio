import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:spendee/screens/transactionlist.dart';

import '../models/transactions/transaction_model.dart';

const transactionDBName = 'Transaction_database';

class TransactionDB {
  TransactionDB.internal();

  static TransactionDB instance = TransactionDB.internal();

  factory TransactionDB() {
    return instance;
  }
  ValueNotifier<List<TransactionModel>> transactionListNotifier =
      ValueNotifier([]);

  Future<void> getAllTransactions() async {
    final transactionDB =
        await Hive.openBox<TransactionModel>(transactionDBName);
    transactionListNotifier.value.clear();

    transactionListNotifier.value.addAll(transactionDB.values);
    transactionListNotifier.notifyListeners();
  }

  Future<void> insertTransaction(TransactionModel obj) async {
    final transactionDB =
        await Hive.openBox<TransactionModel>(transactionDBName);
    await transactionDB.put(obj.id, obj);
    getAllTransactions();
  }

  Future<void> deleteTransaction(TransactionModel transactionModel) async {
    //final db= await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    //await db.delete(id);
    // refresh();
    print('before operation  : ${transactionModel}');
    final transactionDB =
        await Hive.openBox<TransactionModel>(transactionDBName);
    transactionDB.delete(transactionModel.id);
    //await transactionDB.delete(transactionModel);
    print(transactionModel.id);
    overViewListNotifier.notifyListeners();
    getAllTransactions();
  }

  Future<void> editTransaction(TransactionModel value) async {
    final transactionDB =
        await Hive.openBox<TransactionModel>(transactionDBName);
    transactionDB.put(value.id, value);
    getAllTransactions();
  }
}
