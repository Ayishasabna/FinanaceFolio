import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:spendee/data/utility.dart';
import 'package:spendee/models/category/category_model.dart';

const categoryDBName = 'category_database';

ValueNotifier<List<CategoryModel>> CategoryNotifier = ValueNotifier([]);

class CategoryDB {
  // get refreshUI => null;
  CategoryDB.internal();

  static CategoryDB instance = CategoryDB.internal();

  factory CategoryDB() {
    return instance;
  }

  Future<void> getAllCategory() async {
    //final box1 = await Hive.openBox<CategoryModel>(Category_DB_Name);
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

  /* Future<void> refreshUI() async {
    final _allCategories = await getCategories();
    ListNotifier.value.clear();
    ListNotifier.value.addAll(_category.values);
  } */

  Future<void> deleteCategory(int id) async {
    final categoryDB = await Hive.openBox<CategoryModel>('category');
    await categoryDB.delete(id);
    getAllCategory();
    CategoryNotifier.notifyListeners();
  }
}

/* import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:spendee/data/utility.dart';
import 'package:spendee/models/category/category_model.dart';
import 'package:spendee/models/transactions/add_data.dart';

ValueNotifier<List<Add_Data>> ListNotifier = ValueNotifier([]);
ValueNotifier<List<CategoryModel>> ModelNotifier = ValueNotifier([]);

/* Future<void> addStudent(Add_Data value) async {
  // print(value.toString());
  final studentdb = await Hive.openBox<Add_Data>('student_db');
  final _id = await studentdb.add(value);
  value.id = _id;
  ListNotifier.value.add(value);
  ListNotifier.notifyListeners();
  print('hai');
} */
//final box = Hive.box<Add_Data>('data');

Future<void> getAllStudents() async {
  final box = await Hive.openBox<Add_Data>('data');
  ListNotifier.value.clear();
  ListNotifier.value.addAll(box.values);
  // ignore: invalid_use_of_protected_member
  ListNotifier.notifyListeners();
}

Future<void> getAllCategory() async {
  final box1 = await Hive.openBox<CategoryModel>('category');
  ModelNotifier.value.clear();
  ModelNotifier.value.addAll(box1.values);
  // ignore: invalid_use_of_protected_member
  ModelNotifier.notifyListeners();
}

Future<void> deleteTransaction(int id) async {
  final box = await Hive.openBox<Add_Data>('data');
  await box.delete(id);
  getAllStudents();
  ListNotifier.notifyListeners();
}

Future<void> deleteCategory(int id) async {
  final box1 = await Hive.openBox<CategoryModel>('category');
  await box1.delete(id);
  getAllCategory();
  ModelNotifier.notifyListeners();
}

Future<void> updateStudent(int id) async {
  final box = await Hive.openBox<Add_Data>('data');
  //await studentdb.delete(id);
  final student = box.get(id);
  //final item = student?.name;
  //updateStudent(id);
  //_nameController.text = student.name;

  //getAllStudents();
  ListNotifier.notifyListeners();
}

Future<void> editList(int id, Add_Data value) async {
  final box = await Hive.openBox<Add_Data>('data');
  box.putAt(id, value);
  getAllStudents();
}
 */