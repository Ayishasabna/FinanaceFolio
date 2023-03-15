import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:spendee/data/utility.dart';
import 'package:spendee/db/functions/db_functions.dart';
import 'package:spendee/db/transaction_db.dart';
import 'package:spendee/models/category/category_model.dart';

import 'package:spendee/models/transactions/transaction_model.dart';

import 'package:spendee/screens/splash.dart';
import 'package:path_provider/path_provider.dart';

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

  /*  final Directory appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
 */

  Hive.registerAdapter(TransactionModelAdapter());
  await Hive.openBox<TransactionModel>(transactionDBName);

  Hive.registerAdapter(CategoryModelAdapter());
  await Hive.openBox<CategoryModel>(categoryDBName);

  runApp(const MyApp());
  TransactionDB().getAllTransactions();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarColor: Colors.red)),
        primarySwatch: Colors.blue,
      ),
      home: const SafeArea(
        child: Scaffold(
          body: ScreenSplash(),
        ),
      ),
    );
  }
}
