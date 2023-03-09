import 'package:flutter/material.dart';
import 'package:spendee/data/listdata.dart';
import 'package:spendee/data/utility.dart';
import 'package:spendee/models/transactions/add_data.dart';
import 'package:spendee/screens/home_screen.dart';
import 'package:spendee/screens/search.dart';

import '../db/functions/db_functions.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: StudentListNotifier,
        builder:
            (BuildContext ctx, List<Add_Data> transactionList, Widget? child) {
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
                      (context, index) {
                        history = box.values.toList()[index];
                        return get(index, history);
                      },
                      //childCount: geter().length,
                      childCount: box.length,
                    )

                        /* delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                            'assets/images/${geter()[index].image!}',
                            height: 40),
                      ),
                      title: Text(
                        geter()[index].name!,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Color.fromARGB(255, 15, 14, 14)),
                      ),
                      subtitle: Text(
                        geter()[index].time!,
                        style: const TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 15, 14, 14)),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(geter()[index].fee!,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  color: geter()[index].buy!
                                      ? Colors.red
                                      : Colors.green
                                  //Color.fromARGB(255, 15, 14, 14)
                                  )),
                          const SizedBox(
                            width: 20,
                          ),
                          const Icon(
                            Icons.edit,
                            color: Colors.amber,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),
                        ],
                      )
                      );
                },
                childCount: geter().length,
              ) */
                        )
                  ],
                )),
          );
        });
  }

/* Widget getList(Add_Data history, int index) {
  return Dismissible(
      key: UniqueKey(),
      //onDismissed: (Direction) {
      //history.delete();
      //  },
      child: get(index, history));
}
 */
  ListTile get(int index, Add_Data history) {
    return ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset('assets/images/image/${history.name}.png',
              height: 40),
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
        /* trailing: Text(history.amount,
        //geter()[index].fee!,

        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17,
            //color: geter()[index].buy! ? Colors.red : Colors.green
            color: history.IN == 'income' ? Colors.green : Colors.red
            //Color.fromARGB(255, 15, 14, 14)
            )),
 */

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
            const Icon(
              Icons.edit,
              color: Colors.amber,
            ),
            const SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: () {
                if (history != null) {
                  deleteStudent(history.key);
                } else {
                  print('student id is null.Unable to delete');
                }
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),

            /*  GestureDetector(
            key: UniqueKey(),
            onTap: () {
              deleteStudent(history.key);
              //history.delete();

              get(index, history);
            },
            child: const Icon(
              Icons.delete_outline,
              color: Colors.red,
            ),
          ), */
          ],
        ));
  }
}
