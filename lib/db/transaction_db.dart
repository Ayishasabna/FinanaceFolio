import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

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

  Future<void> insertCategory(TransactionModel value) async {
    final transactionDB =
        await Hive.openBox<TransactionModel>(transactionDBName);
    await transactionDB.add(value);
    getAllTransactions();
  }

  Future<void> deleteTransaction(int id) async {
    final transactionDB =
        await Hive.openBox<TransactionModel>(transactionDBName);
    await transactionDB.delete(id);
    getAllTransactions();
    transactionListNotifier.notifyListeners();
  }

  Future<void> edittransaction(int id, TransactionModel value) async {
    final transactionDB =
        await Hive.openBox<TransactionModel>(transactionDBName);
    transactionDB.put(id, value);
    getAllTransactions();
  }
}
