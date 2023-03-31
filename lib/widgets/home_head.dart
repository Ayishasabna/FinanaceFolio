import 'package:flutter/material.dart';
import 'package:spendee/db/income_expence.dart';
import 'package:spendee/widgets/limit.dart';

class HomeHead extends StatefulWidget {
  const HomeHead({super.key});

  @override
  State<HomeHead> createState() => _HomeHeadState();
}

class _HomeHeadState extends State<HomeHead> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    TextEditingController limitController = TextEditingController();
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
                      children: [
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Hello there,',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 19,
                                  color: Color.fromARGB(255, 224, 223, 223)),
                            ),
                            const SizedBox(
                              width: 230,
                            ),
                            GestureDetector(
                              onTap: () async {
                                Navigator.of(context, rootNavigator: true).push(
                                    MaterialPageRoute(
                                        builder: (context) => const Limit()));
                              },
                              child: const Icon(
                                Icons.add_box,
                                size: 30,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                          //width: 10,
                        ),
                        const Text(
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
                  child: Text('₹ ${IncomeAndExpence().total()}',
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
                      Text('₹ ${IncomeAndExpence().income()}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 19,
                              color: Colors.green)),
                      /* const SizedBox(
                      width: 155,
                    ), */
                      Text('₹ ${IncomeAndExpence().expense()}',
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
