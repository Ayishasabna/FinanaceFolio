import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

import 'package:spendee/data/utility.dart';
import 'package:spendee/db/category_db.dart';
import 'package:spendee/db/transaction_db.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:spendee/models/category/category_model.dart';
import 'package:spendee/screens/transactionmainlist.dart';

import 'package:spendee/screens/transactions.dart';
import 'package:spendee/widgets/home_head.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/transactions/transaction_model.dart';

enum SearchItems { categories, date, description }

var history;
var model;
final List<String> day = ['Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun'];

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var displayList = [];
  @override
  Widget build(BuildContext context) {
    //history = transactionDB.values.toList();

    return Scaffold(
        body: SafeArea(
      child: ValueListenableBuilder(
          valueListenable: transactionDB.listenable(),
          builder: (context, value, index) {
            return Column(
              children: [
                SizedBox(height: 350, child: HomeHead()),
                Padding(
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
                Expanded(
                  child: Container(
                    color: Colors.white24,
                    height: 80,
                    child: ValueListenableBuilder(
                        valueListenable:
                            TransactionDB.instance.transactionListNotifier,
                        builder: (BuildContext ctx,
                            List<TransactionModel> newList, Widget? _) {
                          // return newList.length==0? Center(child: Text('NO VALUE'),) :

                          return newList.isEmpty
                              ? Center(
                                  child: Text('No transactions added yet'),
                                )
                              : ListView.separated(
                                  padding: const EdgeInsets.all(5),
                                  itemBuilder: (ctx, index) {
                                    final int lastIndex =
                                        transactionDB.length - 1;
                                    final int reversedIndex = lastIndex - index;

                                    final _value = newList[reversedIndex];
                                    return Card(
                                      color: Color.fromARGB(255, 248, 246, 246),
                                      elevation: 0,
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          backgroundColor: Color.fromARGB(
                                              255, 244, 240, 228),
                                          radius: 50,
                                          child: Image.asset(
                                            'assets/images/image/${_value.category.categoryImage}.png',
                                            height: 30,
                                            width: 30,
                                          ),
                                        ),
                                        // CircleAvatar(
                                        //   radius: 50,

                                        //   backgroundColor: _value.type == CategoryType.income ? Colors.green : Colors.red,
                                        //   child: Text(
                                        //     parseDate(_value.date),
                                        //     textAlign: TextAlign.center,
                                        //   ),
                                        // ),
                                        title: Text('RS ${_value.amount}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 17,
                                                color:
                                                    _value.finanace == 'income'
                                                        ? Colors.green
                                                        : Colors.red)),
                                        subtitle:
                                            Text(_value.category.categoryName),
                                        trailing: Text(
                                          parseDate(_value.datetime),
                                        ),
                                        //
                                      ),
                                    );
                                  },
                                  separatorBuilder: (ctx, index) {
                                    return const Divider(
                                      height: 4,
                                      thickness: 2,
                                    );
                                  },
                                  itemCount: 3
                                  //newList.length > 4 ? 3 : newList.length,
                                  );
                        }),
                  ),
                )
              ],
            );
          }),
    ));
  }

  /*  Expanded(
                      child: ListView.separated(
                        itemBuilder: ((context, index) {
                          ValueListenableBuilder:
                          valueListenable:
                          transactionDB.listenable();
                          //final transaction = displayList[index];
                          final transaction = transactionDB.values.toList();
                          SlidableTransaction(transaction: transaction);
                          /* history = transactionDB.values.toList()[index];
                          return get(index, history); */
                        }),
                        separatorBuilder: (context, index) {
                          return const Divider(
                            height: 5,
                            thickness: 5,
                          );
                        },
                        itemCount: displayList.length,
                      ),
                    ) */
  // SlidableTransaction(transaction: transaction);
}

ListTile get(int index, TransactionModel history) {
  //print(index);
  return ListTile(
    leading: ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.asset(
        'assets/images/image/${history.category.categoryImage}.png',
        //'assets/images/image/${model.categoryImage}.png',
        height: 30,
        width: 30,
      ),
    ),
    title: Text(
      //geter()[index].name!,
      history.category.categoryName,
      //history.category.toString(),

      style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 17,
          color: Color.fromARGB(255, 15, 14, 14)),
    ),
    subtitle: Text(
      parseDate(history.datetime),
      //'${day[history.datetime.weekday - 1]}-${history.datetime.year} ${DateFormat.MMMd().format(history.datetime)}',
      //DateFormat.MMMd().format(date);
      //'${day[history.datetime.weekday - 1]}-${history.datetime.year}-${history.datetime.month}-${history.datetime.day}',
      style:
          const TextStyle(fontSize: 15, color: Color.fromARGB(255, 15, 14, 14)),
    ),
    trailing: Text(history.amount,
        //geter()[index].fee!,

        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17,
            color: history.finanace == 'income' ? Colors.green : Colors.red)),
  );
}

String parseDateTime(DateTime date) {
  final dateFormatted = DateFormat.MMMMd().format(date);

  final splitedDate = dateFormatted.split(' ');

  return "${splitedDate.last}  ${splitedDate.first} ";
}

String parseDate(DateTime date) {
  return '${day[date.weekday - 1]}-${date.year} ${DateFormat.MMMd().format(date)}';
}
