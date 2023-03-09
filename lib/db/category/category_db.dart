/* import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:spendee/models/category/category_model.dart';
import 'package:spendee/screens/add_category.dart';

const CATEGORY_DB_NAME = 'category-database';

abstract class CategoryDbFunctions {
  Future<List<CategoryModel>> getcategories();
  Future<void> insertCategory(CategoryModel value);
} */

/* class CategoryDB implements CategoryDbFunctions {
  @override
  Future<void> insertCategory(CategoryModel value) async {
    final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    await _categoryDB.add(value);
  }

  @override
  Future<List<CategoryModel>> getcategories() async {
    final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    return _categoryDB.values.toList();
  }
} */
