import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:spendee/models/category/category_model.dart';
import 'package:spendee/models/transactions/add_data.dart';
import 'package:spendee/screens/first_screen.dart';

const SAVE_KEY_NAME = 'User logged in';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  /*  if (!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId)) {
    Hive.registerAdapter(CategoryTypeAdapter());
  }

  if (!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)) {
    Hive.registerAdapter(CategoryModelAdapter());
  } */

  Hive.registerAdapter(AddDataAdapter());
  await Hive.openBox<Add_Data>('data');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SafeArea(
        child: Scaffold(
          body: FirstScreen(),
        ),
      ),
    );
  }
}
