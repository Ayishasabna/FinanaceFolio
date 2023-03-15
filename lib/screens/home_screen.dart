/* import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:spendee/data/utility.dart';
import 'package:spendee/models/transactions/add_data.dart';

import 'package:spendee/screens/transactions.dart';


//var history;
//var model;
final List<String> day = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday'
];

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //final box = Hive.box<Add_Data>('data');
  //final transaction_db = Hive.openBox<Add_Data>(Transaction_DB_Name);
  //final category_db = Hive.openBox<CategoryModel>(Category_DB_Name);
  //final box1 = Hive.box<category>('category');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: transactionDB.listenable(),
        builder: (context, value, child) {
          return ValueListenableBuilder(
            valueListenable: transactionDB.listenable(),
            builder: (context, value, child) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(height: 350, child: _head()),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Recent Transactions',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  color: Color.fromARGB(255, 15, 14, 14))),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Transactions()));
                            },
                            child: const Text('See all',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 15, 14, 14))),
                          )
                        ],
                      ),
                    ),
                  ),
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                    (context, index) {
                    final  history = transactionDB.values.toList()[index];
                      return getList(history, index);
                    },
                    //childCount: geter().length,
                    childCount: transactionDB.length,
                  ))
                ],
              );
            },
          );
        },
      )),
    );
  }

  Widget getList(Add_Data history, int index) {
    return Dismissible(
        key: UniqueKey(),
        onDismissed: (Direction) {
          history.delete();
        },
        child: get(index, history));
  }

  ListTile get(int index, Add_Data history) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child:
            Image.asset('assets/images/image/${model.image!}.png', height: 40),
      ),
      title: Text(
        //geter()[index].name!,
        history.name,

        style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17,
            color: Color.fromARGB(255, 15, 14, 14)),
      ),
      subtitle: Text(
        //geter()[index].time!,
        //history.explain,
        //
        // '${day[history.datetime.weekday-1]} ${history.datetime.year}',
        '${[
          history.datetime.weekday - 1
        ]} ${history.datetime.year}-${history.datetime.day}-${history.datetime.month}',
        //'Date : ${date.year}/${date.month}/${date.day}',
        style: const TextStyle(
            fontSize: 17, color: Color.fromARGB(255, 15, 14, 14)),
      ),
      trailing: Text(history.amount,
          //geter()[index].fee!,

          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
              //color: geter()[index].buy! ? Colors.red : Colors.green
              color: history.IN == 'income' ? Colors.green : Colors.red
              //Color.fromARGB(255, 15, 14, 14)
              )),
    );
  }

  Widget _head() {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 240,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(199, 12, 12, 0.88),
                    Color.fromRGBO(255, 67, 40, 0.88),
                    Color.fromRGBO(255, 152, 100, 0.88)
                  ]),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Stack(
                children: [
                  Positioned(
                      top: 35,
                      left: 340,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 35, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Hi,Ayisha',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 19,
                              color: Color.fromARGB(255, 224, 223, 223)),
                        ),
                        SizedBox(
                          height: 10,
                          //width: 10,
                        ),
                        Text(
                          'Welcome back!',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 19,
                              color: Color.fromARGB(255, 224, 223, 223)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 160,
          left: 35,
          child: Container(
            height: 170,
            width: 320,
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 6),
                  blurRadius: 12,
                  spreadRadius: 6),
            ], color: Colors.white, borderRadius: BorderRadius.circular(24)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Total Balance',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 19,
                          color: Color.fromARGB(255, 15, 14, 14))),
                ),
                const SizedBox(height: 7),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text('Rs. ${total()}',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 19,
                          color: Color.fromARGB(255, 15, 14, 14))),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          CircleAvatar(
                            radius: 13,
                            backgroundColor: Colors.green,
                            child: Icon(
                              Icons.arrow_upward,
                              color: Colors.white,
                              size: 19,
                            ),
                          ),
                          SizedBox(width: 7),
                          Text('Income',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 15, 14, 14))),
                        ],
                      ),
                      Row(
                        children: const [
                          CircleAvatar(
                            radius: 13,
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.arrow_downward,
                              color: Colors.white,
                              size: 19,
                            ),
                          ),
                          SizedBox(width: 7),
                          Text('Expense',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 15, 14, 14))),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Rs.${income()}',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 19,
                              color: Colors.green)),
                      Text('Rs.${expense()}',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 19,
                              color: Colors.red)),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
} */

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:spendee/data/listdata.dart';
import 'package:spendee/data/utility.dart';
import 'package:spendee/db/functions/db_functions.dart';
import 'package:spendee/db/transaction_db.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:spendee/models/category/category_model.dart';

import 'package:spendee/screens/transactions.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/transactions/transaction_model.dart';

var history;
var model;
final List<String> day = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday'
];

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //final box = Hive.box<Add_Data>('data');
  //final transaction_db = Hive.openBox<Add_Data>(Transaction_DB_Name);
  //final category_db = Hive.openBox<CategoryModel>(Category_DB_Name);
  //final box1 = Hive.box<CategoryModel>('category');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: transactionDB.listenable(),
        builder: (context, value, child) {
          //print(transactionDB);
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(height: 350, child: _head()),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Recent Transactions',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Color.fromARGB(255, 15, 14, 14))),
                      GestureDetector(
                        onTap: () {
                          /*   TransactionDB()
                              .transactionListNotifier
                              .notifyListeners(); */
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Transactions()));
                        },
                        child: const Text('See all',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: Color.fromARGB(255, 15, 14, 14))),
                      )
                    ],
                  ),
                ),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                (context, index) {
                  print(index);
                  final int lastIndex = transactionDB.length - 1;
                  final int reversedIndex = lastIndex - index;
                  if (reversedIndex >= 0) {
                    history = transactionDB.getAt(reversedIndex);
                    model = categoryDB.getAt(reversedIndex);
                    return get(index, history, model);
                    //getList(history, index, model);
                  }

                  /* final int lastIndex = transactionDB.length - 1;
                  final int reversedIndex = lastIndex - index;
                  if (reversedIndex >= 0) {
                    history = transactionDB.getAt(reversedIndex);
                    model = categoryDB.getAt(reversedIndex);
                  } */
/* 
                  history = transactionDB.values.toList()[index];
                  model = categoryDB.values.toList()[index];
                  index = transactionDB.length;

                  return getList(history, index, model); */
                },
                childCount:
                    transactionDB.length >= 3 ? 3 : transactionDB.length,

                //childCount: box.length,
              ))
            ],
          );
        },
      )),
    );
  }

  Widget getList(TransactionModel history, int index, CategoryModel model) {
    //final _values=history[index];
    return Slidable(
        //key: UniqueKey(),
        //key:,
        startActionPane: ActionPane(motion: ScrollMotion(), children: [
          SlidableAction(
            onPressed: (context) {
              //TransactionDB.instance.deleteTransaction(index);

              history.delete();

              //TransactionDB().transactionListNotifier.notifyListeners();

              //TransactionDB.instance.deleteTransaction(index);
            },
            icon: Icons.delete,
            label: 'Delete',
          )
        ]),
        child: get(index, history, model));
    /* return Dismissible(
        key: UniqueKey(),
        onDismissed: (Direction) {
          history.delete();
        },
        child: get(index, history, model)); */
  }

  ListTile get(int index, TransactionModel history, CategoryModel model) {
    //print(index);
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child:
            Image.asset('assets/images/image/${model.image}.png', height: 40),
      ),
      title: Text(
        //geter()[index].name!,
        history.name,

        style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17,
            color: Color.fromARGB(255, 15, 14, 14)),
      ),
      subtitle: Text(
        '${day[history.datetime.weekday - 1]}-${history.datetime.year}-${history.datetime.month}-${history.datetime.day}',
        style: const TextStyle(
            fontSize: 15, color: Color.fromARGB(255, 15, 14, 14)),
      ),
      trailing: Text(history.amount,
          //geter()[index].fee!,

          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
              color: history.IN == 'income' ? Colors.green : Colors.red)),
    );
  }

  Widget _head() {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 240,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(199, 12, 12, 0.88),
                    Color.fromRGBO(255, 67, 40, 0.88),
                    Color.fromRGBO(255, 152, 100, 0.88)
                  ]),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Stack(
                children: [
                  Positioned(
                      top: 35,
                      left: 340,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 35, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Hi,Ayisha',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 19,
                              color: Color.fromARGB(255, 224, 223, 223)),
                        ),
                        SizedBox(
                          height: 10,
                          //width: 10,
                        ),
                        Text(
                          'Welcome back!',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 19,
                              color: Color.fromARGB(255, 224, 223, 223)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 160,
          left: 35,
          child: Container(
            height: 170,
            width: 320,
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 6),
                  blurRadius: 12,
                  spreadRadius: 6),
            ], color: Colors.white, borderRadius: BorderRadius.circular(24)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Total Balance',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 19,
                          color: Color.fromARGB(255, 15, 14, 14))),
                ),
                const SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text('Rs. ${total()}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 19,
                          color: Color.fromARGB(255, 15, 14, 14))),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          CircleAvatar(
                            radius: 13,
                            backgroundColor: Colors.green,
                            child: Icon(
                              Icons.arrow_upward,
                              color: Colors.white,
                              size: 19,
                            ),
                          ),
                          SizedBox(width: 7),
                          Text('Income',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 15, 14, 14))),
                        ],
                      ),
                      Row(
                        children: const [
                          CircleAvatar(
                            radius: 13,
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.arrow_downward,
                              color: Colors.white,
                              size: 19,
                            ),
                          ),
                          SizedBox(width: 7),
                          Text('Expense',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 15, 14, 14))),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Rs.${income()}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 19,
                              color: Colors.green)),
                      Text('Rs.${expense()}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 19,
                              color: Colors.red)),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
