import 'package:flutter/material.dart';
import 'package:spendee/data/top.dart';
import 'package:spendee/data/utility.dart';
import 'package:spendee/models/transactions/transaction_model.dart';

import 'package:spendee/screens/home_screen.dart';
import 'package:spendee/screens/transactions.dart';
import 'package:spendee/widgets/app_bar.dart';
import 'package:spendee/widgets/chart.dart';

class Statitics extends StatefulWidget {
  const Statitics({super.key});

  @override
  State<Statitics> createState() => _StatiticsState();
}

ValueNotifier statiNotifier = ValueNotifier(0);

class _StatiticsState extends State<Statitics> {
  var finanace;
  List day = ['Day', 'Week', 'Month', 'Year'];
  List function = [today(), week(), month(), year()];
  List<TransactionModel> stati = ([]);

  //List<Add_Data> stati = [];
  int index_color = 0;
  //ValueNotifier kj = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appbar('Statitics', true),

        //body: custom(),
        body: ValueListenableBuilder(
            valueListenable: statiNotifier,
            builder: (BuildContext context, dynamic value, Widget? child) {
              stati = function[value];
              return custom();
            }),
      ),
    );
  }

  CustomScrollView custom() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(4, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            index_color = index;
                            statiNotifier.value = index;
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: index_color == index
                                ? Colors.amber
                                : Colors.white,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            day[index],
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: index_color == index
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      );
                    })
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          //SizedBox(width: 10),
                          Flexible(
                            child: Text(
                              'Expense',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          //SizedBox(width: 20),
                          Icon(
                            Icons.arrow_downward_sharp,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              /* Chart(
                indexx: index_color,
              ), */
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Top Spending',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Icon(
                      Icons.swap_vert,
                      size: 25,
                      color: Colors.grey,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          var expenseTransactions =
              stati.where((item) => item.IN != 'income').toList();

          expenseTransactions.sort((a, b) => b.amount.compareTo(a.amount));

          var topThreeTransactions = expenseTransactions.take(3).toList();
          print(topThreeTransactions);

          for (var i = 0; i < topThreeTransactions.length; i++) {
            var transaction = topThreeTransactions[i];

            return ListTile(
              title: Text(
                transaction.name,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color: Color.fromARGB(255, 15, 14, 14)),
              ),
              subtitle: Text(
                '${day[stati[index].datetime.weekday - 1]} ${stati[index].datetime.year}-${stati[index].datetime.day}-${stati[index].datetime.month}',
                style: const TextStyle(
                    fontSize: 17, color: Color.fromARGB(255, 15, 14, 14)),
              ),
              trailing: Text(transaction.amount),
            );
          }
          return SizedBox.shrink();
        }, childCount: 2))
      ],
    );
  }
}
