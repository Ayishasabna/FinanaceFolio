import 'package:flutter/material.dart';
import 'package:spendee/db/transaction_db.dart';
import 'package:spendee/models/transactions/transaction_model.dart';
import 'package:spendee/statitics/statitics_all.dart';
import 'package:spendee/widgets/app_bar.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'screen_expense.dart';
import 'screen_income.dart';

ValueNotifier<List<TransactionModel>> overViewGraphNotifier =
    ValueNotifier(TransactionDB.instance.transactionListNotifier.value);

class Statitics extends StatefulWidget {
  const Statitics({super.key});

  @override
  State<Statitics> createState() => _TransactionInsightsAllState();
}

class _TransactionInsightsAllState extends State<Statitics> {
  String dateFilterTitle = "All";

  @override
  void initState() {
    super.initState();
    overViewGraphNotifier.value =
        TransactionDB.instance.transactionListNotifier.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 245, 245),
      appBar: appbar('Statitics', true),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                const Text(
                  'Date  ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                PopupMenuButton<int>(
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      70,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 15.0,
                    ),
                    child: Row(
                      children: [
                        Text(
                          dateFilterTitle,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_drop_down,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: const Text(
                        "All",
                      ),
                      onTap: () {
                        overViewGraphNotifier.value = TransactionDB
                            .instance.transactionListNotifier.value;
                        setState(() {
                          dateFilterTitle = "All";
                        });
                      },
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: const Text(
                        "Today",
                      ),
                      onTap: () {
                        overViewGraphNotifier.value = TransactionDB
                            .instance.transactionListNotifier.value;
                        overViewGraphNotifier.value = overViewGraphNotifier
                            .value
                            .where((element) =>
                                element.datetime.day == DateTime.now().day &&
                                element.datetime.month ==
                                    DateTime.now().month &&
                                element.datetime.year == DateTime.now().year)
                            .toList();
                        setState(() {
                          dateFilterTitle = "Today";
                        });
                      },
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: const Text(
                        "Yesterday",
                      ),
                      onTap: () {
                        overViewGraphNotifier.value = TransactionDB
                            .instance.transactionListNotifier.value;
                        overViewGraphNotifier.value = overViewGraphNotifier
                            .value
                            .where((element) =>
                                element.datetime.day ==
                                    DateTime.now().day - 1 &&
                                element.datetime.month ==
                                    DateTime.now().month &&
                                element.datetime.year == DateTime.now().year)
                            .toList();
                        setState(() {
                          dateFilterTitle = "Yesterday";
                        });
                      },
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: const Text(
                        "Month",
                      ),
                      onTap: () {
                        overViewGraphNotifier.value = TransactionDB
                            .instance.transactionListNotifier.value;

                        overViewGraphNotifier.value = overViewGraphNotifier
                            .value
                            .where((element) =>
                                element.datetime.month ==
                                    DateTime.now().month &&
                                element.datetime.year == DateTime.now().year)
                            .toList();
                        setState(() {
                          dateFilterTitle = "Month";
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 3,
              initialIndex: 0,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    // transformAlignment: Alignment.center,

                    width: double.infinity,
                    child: ButtonsTabBar(
                      backgroundColor: Colors.amber,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 40),
                      tabs: const [
                        Tab(
                          iconMargin: EdgeInsets.all(30),
                          text: 'All',
                        ),
                        Tab(
                          text: 'Income',
                        ),
                        Tab(
                          text: 'Expense',
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: TabBarView(children: [
                    const ScreenAll(),
                    ScreenIncomeChart(),
                    const ScreenExpenseChart(),
                  ]))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
