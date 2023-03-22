import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:spendee/db/income_expence.dart';
import 'package:spendee/db/transaction_db.dart';
import 'package:spendee/models/category/category_model.dart';

const categoryDBName = 'category_database';

ValueNotifier<List<CategoryModel>> CategoryNotifier = ValueNotifier([]);

class CategoryDB {
  CategoryDB.internal();

  static CategoryDB instance = CategoryDB.internal();

  factory CategoryDB() {
    return instance;
  }

  Future<void> getAllCategory() async {
    final categoryDB = await Hive.openBox<CategoryModel>(categoryDBName);
    CategoryNotifier.value.clear();
    CategoryNotifier.value.addAll(categoryDB.values);
    CategoryNotifier.notifyListeners();
  }

  Future<void> insertCategory(CategoryModel value) async {
    final categoryDB = await Hive.openBox<CategoryModel>(categoryDBName);
    await categoryDB.add(value);
    getAllCategory();
  }

  Future<List<CategoryModel>> getCategories() async {
    final categoryDB = await Hive.openBox<CategoryModel>(categoryDBName);
    return categoryDB.values.toList();
  }

  Future<void> deleteCategory(int id) async {
    final categoryDB = await Hive.openBox<CategoryModel>('category');
    await categoryDB.delete(id);
    getAllCategory();
    CategoryNotifier.notifyListeners();
  }
}
