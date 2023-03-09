import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:spendee/models/transactions/add_data.dart';

ValueNotifier<List<Add_Data>> StudentListNotifier = ValueNotifier([]);

/* Future<void> addStudent(Add_Data value) async {
  // print(value.toString());

  final studentdb = await Hive.openBox<Add_Data>('student_db');
  final _id = await studentdb.add(value);
  value.id = _id;
  StudentListNotifier.value.add(value);
  StudentListNotifier.notifyListeners();
  print('hai');
} */
//final box = Hive.box<Add_Data>('data');

Future<void> getAllStudents() async {
  final box = await Hive.openBox<Add_Data>('data');
  StudentListNotifier.value.clear();
  StudentListNotifier.value.addAll(box.values);
  // ignore: invalid_use_of_protected_member
  StudentListNotifier.notifyListeners();
}

Future<void> deleteStudent(int id) async {
  final box = await Hive.openBox<Add_Data>('data');
  await box.delete(id);
  getAllStudents();
  StudentListNotifier.notifyListeners();
}

/* Future<void> updateStudent(int id) async {
  final box = await Hive.openBox<Add_Data>('data');
  //await studentdb.delete(id);
  final student = studentdb.get(id);
  final item = student?.name;
  //updateStudent(id);
  //_nameController.text = student.name;

  //getAllStudents();
  StudentListNotifier.notifyListeners();
}
 */
/* Future<void> editList(int id, StudentModel value) async {
  final studentDatabase = await Hive.openBox<StudentModel>('student_db');
  studentDatabase.putAt(id, value);
  getAllStudents();
} */