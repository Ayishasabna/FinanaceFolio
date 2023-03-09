import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:spendee/data/listdata.dart';
import 'package:spendee/data/utility.dart';
import 'package:spendee/models/transactions/add_data.dart';
import 'package:spendee/screens/transactions.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:sizer/sizer.dart';

var history;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final box = Hive.box<Add_Data>('data');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, value, child) {
          return ValueListenableBuilder(
            valueListenable: box.listenable(),
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
                      history = box.values.toList()[index];
                      return getList(history, index);
                    },
                    //childCount: geter().length,
                    childCount: box.length,
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
            Image.asset('assets/images/image/${history.name}.png', height: 40),
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
}
