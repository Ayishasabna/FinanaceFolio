import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spendee/db/transaction_db.dart';
import 'package:spendee/filter/date_filter_transaction.dart';
import 'package:spendee/filter/type_filter_transaction.dart';
import 'package:spendee/models/category/category_model.dart';
import 'package:spendee/models/transactions/transaction_model.dart';

import 'package:spendee/screens/home_screen.dart';
import 'package:spendee/screens/search_field.dart';
import 'package:spendee/screens/transactionlist.dart';

ValueNotifier showCategory = ValueNotifier('All');

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  ValueNotifier showCategory = ValueNotifier('All');
  TextEditingController amount_c = TextEditingController();
  @override
  void initState() {
    overViewListNotifier.value =
        TransactionDB.instance.transactionListNotifier.value;
    //ValueNotifier<List<TransactionModel>> overViewListNotifier =
    // ValueNotifier(TransactionDB.instance.transactionListNotifier.value);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /* return ValueListenableBuilder(
        //valueListenable: TransactionDB().transactionListNotifier,
        valueListenable: TransactionDB.instance.transactionListNotifier,
        builder: (BuildContext ctx, List<TransactionModel> transactionList,
            Widget? child) {
          TransactionDB().transactionListNotifier.notifyListeners(); */
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            actions: [
              DateFilterTransaction(),
              SizedBox(
                width: 10,
              ),
              TypeFilterClass(),
              SizedBox(
                width: 20,
              ),
            ],

            /* actions: <Widget>[

                    IconButton(
                        onPressed: () {
                          showSearch(
                            context: context,
                            delegate: SearchWidget(),
                          );
                        },
                        icon: const Icon(Icons.search)
                        )
                  ], */
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
          body: Column(
            children: [
              SearchField(),
              Expanded(
                child: TransactionList(),

                /* CustomScrollView(
                        slivers: [
                          //Searchfield(),
                          SliverList(
                              delegate:
                                  SliverChildBuilderDelegate((ctx, index) {
                            //history = transactionList[index];
                            history = transactionDB.values.toList()[index];
                            model = categoryDB.values.toList()[index];
                            return ListTile(
                                leading: Image.asset(
                                  'assets/images/image/${model.categoryImage}.png',
                                  height: 30,
                                  width: 30,
                                ),
                                /*  leading: ClipRRect(
                              borderRadius: BorderRadius.circular(1),
                              child:
                                  Image.asset('assets/images/image/${model.image}.png', height: 30),
                            ), */
                                title: Text(
                                  history.category.categoryName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 15, 14, 14)),
                                ),
                                subtitle: Text(
                                  parseDate(history.datetime),
                                  // '${day[history.datetime.weekday - 1]}-${history.datetime.year}-${history.datetime.month}-${history.datetime.day}',
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 15, 14, 14)),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(history.amount,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17,
                                            color: history.finanace == 'income'
                                                ? Colors.green
                                                : Colors.red
                                            //Color.fromARGB(255, 15, 14, 14)
                                            )),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    IconButton(
                                      onPressed: (() {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditTransaction(
                                                        obj: history)
                                                /* EditTransaction(
                                                name: history.category.toString(),
                                                explain: history.explain,
                                                amount: history.amount,
                                                finanace: history.finanace,
                                                date_time:
                                                    history.datetime.toString(),
                                                index: index) */
                                                ));
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
                                        print(transactionDB.length);
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
                                              padding:
                                                  const EdgeInsets.all(20.0),
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
                                                          .deleteTransaction(
                                                              history.key);
                                                      /*  TransactionDB.instance
                                        .deleteTransaction(history.id); */

                                                      //.deleteTransaction(history.key);
                                                    }),
                                                    child: const Text('Yes'),
                                                  ),
                                                  TextButton(
                                                      onPressed: (() {
                                                        popoutfuction(context);
                                                        TransactionList();
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
                            //get(index, history, model);
                          }, childCount: transactionDB.length

                                      //transactionDB.length,
                                      ))
                        ],
                      ), */
              ),
            ],
          )),
    );
  }
}

/* ListTile get(int index, TransactionModel history, CategoryModel model) {
    return ListTile(
        leading: Image.asset(
          'assets/images/image/${model.categoryImage}.png',
          height: 30,
          width: 30,
        ),
        /*  leading: ClipRRect(
          borderRadius: BorderRadius.circular(1),
          child:
              Image.asset('assets/images/image/${model.image}.png', height: 30),
        ), */
        title: Text(
          history.category.categoryName,
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
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
                    color:
                        history.finanace == 'income' ? Colors.green : Colors.red
                    //Color.fromARGB(255, 15, 14, 14)
                    )),
            const SizedBox(
              width: 20,
            ),
          /*   IconButton(
              onPressed: (() {
                print('edit button clicked');
                //Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => EditTransaction(obj: history),

                  /* EditTransaction(
                        name: history.category.toString(),
                        explain: history.explain,
                        amount: history.amount,
                        finanace: history.finanace,
                        date_time: history.datetime.toString(),
                        index: index) */
                )); */
                /* EditTransaction(
                    name: history.name,
                    explain: history.explain,
                    amount: history.amount,
                    finanace: history.IN,
                    date_time: history.datetime.toString(),
                    index: index); */

               // print(TransactionModel(
                   /*  finanace: history.finanace,
                    amount: history.amount,
                    datetime: history.datetime,
                    explain: history.explain,
                    categoryName: history.categoryName,
                    id: history.id,
                    category: history.category) */
                    //);
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
                print('delete clicked');
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
                              /*  TransactionDB.instance
                                  .deleteTransaction(history.id); */

                              //.deleteTransaction(history.key);
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
 */
popoutfuction(BuildContext context) {
  return Navigator.of(context).pop();
}

String parseDate(DateTime date) {
  /* final _date = DateFormat.MMMd().format(date);
    final _splitDate = _date.split('');
    return '${_splitDate.last}${_splitDate.first}'; */

  return '${day[date.weekday - 1]}-${date.year} ${DateFormat.MMMd().format(date)}';

  //return '${date.day}\n${date.month}';
}
