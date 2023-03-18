import 'package:flutter/material.dart';
import 'package:spendee/data/utility.dart';

class HomeHead extends StatelessWidget {
  const HomeHead({super.key});

  @override
  Widget build(BuildContext context) {
    return _head();
  }
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
