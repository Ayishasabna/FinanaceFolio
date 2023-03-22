import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:spendee/db/income_expence.dart';
import 'package:spendee/db/transaction_db.dart';
import 'package:spendee/screens/transaction/transactions.dart';
import 'package:spendee/widgets/home_head.dart';
import 'package:spendee/widgets/uppercase.dart';
import '../models/transactions/transaction_model.dart';

//enum SearchItems { categories, date, description }

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
    return Scaffold(
        body: SafeArea(
      child: ValueListenableBuilder(
          valueListenable: transactionDB.listenable(),
          builder: (context, value, index) {
            return Column(
              children: [
                const SizedBox(height: 350, child: HomeHead()),
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
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Transactions()));
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
                          return newList.isEmpty
                              ? const Center(
                                  child: Text('No transactions added yet'),
                                )
                              : ListView.separated(
                                  padding: const EdgeInsets.all(5),
                                  itemBuilder: (ctx, index) {
                                    final int lastIndex =
                                        transactionDB.length - 1;
                                    final int reversedIndex = lastIndex - index;

                                    final value = newList[reversedIndex];
                                    return Card(
                                      color: const Color.fromARGB(
                                          255, 248, 246, 246),
                                      elevation: 0,
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          backgroundColor: const Color.fromARGB(
                                              255, 244, 240, 228),
                                          radius: 50,
                                          child: Image.asset(
                                            'assets/images/image/${value.category.categoryImage}.png',
                                            height: 30,
                                            width: 30,
                                          ),
                                        ),

                                        title: Text('₹ ${value.amount}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 17,
                                                color:
                                                    value.finanace == 'income'
                                                        ? Colors.green
                                                        : Colors.red)),
                                        subtitle: Text(value
                                            .category.categoryName
                                            .capitalize()),
                                        trailing: Text(
                                          parseDateTime(value.datetime),
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
                                  itemCount:
                                      newList.length > 3 ? 3 : newList.length,
                                );
                        }),
                  ),
                )
              ],
            );
          }),
    ));
  }
}

String parseDateTime(DateTime date) {
  final dateFormatted = DateFormat.MMMMd().format(date);

  final splitedDate = dateFormatted.split(' ');

  return "${splitedDate.last}  ${splitedDate.first} ";
}
