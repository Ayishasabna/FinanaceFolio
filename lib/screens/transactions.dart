import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spendee/data/utility.dart';
import 'package:spendee/db/transaction_db.dart';
import 'package:spendee/models/transactions/transaction_model.dart';
import 'package:spendee/screens/edit_screen.dart';
//import 'package:spendee/db/transaction_db.dart';
import 'package:spendee/screens/home_screen.dart';
import 'package:spendee/screens/search.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  TextEditingController amount_c = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        //valueListenable: TransactionDB().transactionListNotifier,
        valueListenable: TransactionDB.instance.transactionListNotifier,
        builder: (BuildContext ctx, List<TransactionModel> transactionList,
            Widget? child) {
          TransactionDB().transactionListNotifier.notifyListeners();
          return SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  actions: <Widget>[
                    IconButton(
                        onPressed: () {
                          showSearch(
                            context: context,
                            delegate: SearchWidget(),
                          );
                        },
                        icon: const Icon(Icons.search))
                  ],
                  flexibleSpace: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(247, 22, 22, 0.878),
                        Color.fromRGBO(255, 67, 40, 0.88),
                        Color.fromRGBO(255, 152, 100, 0.88),
                      ]),
                    ),
                  ),
                  title: const Center(
                    child: Text('Transactions'),
                  ),
                ),
                body: CustomScrollView(
                  slivers: [
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                      (ctx, index) {
                        //history = transactionList[index];
                        history = transactionDB.values.toList()[index];
                        return get(index, history);
                      },
                      childCount: transactionList.length,
                      //transactionDB.length,
                    ))
                  ],
                )),
          );
        });
  }

  ListTile get(int index, TransactionModel history) {
    return ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child:
              Image.asset('assets/images/image/${model.image}.png', height: 40),
        ),
        title: Text(
          history.name,
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
              color: Color.fromARGB(255, 15, 14, 14)),
        ),
        subtitle: Text(
          parseDate(history.datetime),
          // '${day[history.datetime.weekday - 1]}-${history.datetime.year}-${history.datetime.month}-${history.datetime.day}',
          style: const TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 15, 14, 14)),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(history.amount,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color: history.IN == 'income' ? Colors.green : Colors.red
                    //Color.fromARGB(255, 15, 14, 14)
                    )),
            const SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: (() {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditTransaction(
                        name: history.name,
                        explain: history.explain,
                        amount: history.amount,
                        finanace: history.IN,
                        date_time: history.datetime.toString(),
                        index: index)));
                /* EditTransaction(
                    name: history.name,
                    explain: history.explain,
                    amount: history.amount,
                    finanace: history.IN,
                    date_time: history.datetime.toString(),
                    index: index); */
                print('haiiiii');
                /*         showDialog(
                  context: context,
                  builder: ((context) {
                    return AlertDialog(
                      title: const Center(
                        child: Text(
                          'Edit Transaction',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                      content: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextField(
                            controller: amount_c,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter amount',
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: (() {
                            popoutfuction(context);
                            /*  final transaction = Add_Data(
                                history.IN,
                                amount_c.text,
                                history.datetime,
                                history.explain,
                                history.name); */

                           

                            //edittransaction(history.key, transaction);
                          }),
                          child: const Text('Yes'),
                        ),
                        TextButton(
                            onPressed: (() {
                              popoutfuction(context);
                            }),
                            child: const Text('No'))
                      ],
                    );
                  }),
                ); */
              }),
              icon: const Icon(
                Icons.edit,
                color: Colors.blue,
              ),
              tooltip: 'Edit',
            ),
            const SizedBox(
              width: 5,
            ),
            IconButton(
              onPressed: (() {
                showDialog(
                  context: context,
                  builder: ((context) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: AlertDialog(
                        title: const Text(
                          'Alert!',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        content: const Text(
                          "Do you want to delete this transaction",
                        ),
                        actions: [
                          TextButton(
                            onPressed: (() {
                              popoutfuction(context);
                              TransactionDB.instance
                                  .deleteTransaction(history.key);
                            }),
                            child: const Text('Yes'),
                          ),
                          TextButton(
                              onPressed: (() {
                                popoutfuction(context);
                              }),
                              child: const Text('No'))
                        ],
                      ),
                    );
                  }),
                );
              }),
              icon: const Icon(
                Icons.delete_outline,
                color: Colors.red,
              ),
              tooltip: 'Delete',
            ),
          ],
        ));
  }

  popoutfuction(BuildContext context) {
    return Navigator.of(context).pop();
  }

  String parseDate(DateTime date) {
    /* final _date = DateFormat.MMMd().format(date);
    final _splitDate = _date.split('');
    return '${_splitDate.last}${_splitDate.first}'; */

    return DateFormat.MMMd().format(date);

    //return '${date.day}\n${date.month}';
  }
}
