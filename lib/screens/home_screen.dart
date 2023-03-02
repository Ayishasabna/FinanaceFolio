import 'package:flutter/material.dart';

import 'package:spendee/data/listdata.dart';

import 'package:spendee/screens/transactions.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              //child: SizedBox(height: 350, child: _head()),
              child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 240,
                    decoration: BoxDecoration(
                        gradient: new LinearGradient(colors: [
                          Color.fromRGBO(199, 12, 12, 0.88),
                          Color.fromRGBO(255, 67, 40, 0.88),
                          Color.fromRGBO(255, 152, 100, 0.88)
                        ]),

                        //Color.fromRGBO(199, 12, 12, 0.88),
                        // Color.fromRGBO(255, 67, 40, 0.88),

                        //rgba(199, 12, 12, 0.88)
                        //rgba(255, 67, 40, 0.88)
                        //rgba(255, 152, 100, 0.88)

                        //color: Colors.yellowAccent,
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
                              child: Container(
                                height: 40,
                                width: 40,
                                color: const Color.fromRGBO(250, 250, 250, 0.1),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Transactions()));
                                  },
                                  child: Icon(
                                    Icons.search,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
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
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 6),
                            blurRadius: 12,
                            spreadRadius: 6),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24)),
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
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text('Rs.2000',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 19,
                                color: Color.fromARGB(255, 15, 14, 14))),
                      ),
                      SizedBox(height: 25),
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
                                        color:
                                            Color.fromARGB(255, 15, 14, 14))),
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
                                        color:
                                            Color.fromARGB(255, 15, 14, 14))),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Rs.300',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 19,
                                    color: Colors.green)),
                            Text('Rs.300',
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
          )),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Recent Transactions',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: Color.fromARGB(255, 15, 14, 14))),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Transactions()));
                    },
                    child: Text('See all',
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
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset('assets/images/${geter()[index].image!}',
                      height: 40),
                ),
                title: Text(
                  geter()[index].name!,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: Color.fromARGB(255, 15, 14, 14)),
                ),
                subtitle: Text(
                  geter()[index].time!,
                  style: TextStyle(
                      fontSize: 17, color: Color.fromARGB(255, 15, 14, 14)),
                ),
                trailing: Text(geter()[index].fee!,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: geter()[index].buy! ? Colors.red : Colors.green
                        //Color.fromARGB(255, 15, 14, 14)
                        )),
              );
            },
            childCount: geter().length,
          ))
        ],
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
              decoration: BoxDecoration(
                  gradient: new LinearGradient(colors: [
                    Color.fromRGBO(199, 12, 12, 0.88),
                    Color.fromRGBO(255, 67, 40, 0.88),
                    Color.fromRGBO(255, 152, 100, 0.88)
                  ]),

                  //Color.fromRGBO(199, 12, 12, 0.88),
                  // Color.fromRGBO(255, 67, 40, 0.88),

                  //rgba(199, 12, 12, 0.88)
                  //rgba(255, 67, 40, 0.88)
                  //rgba(255, 152, 100, 0.88)

                  //color: Colors.yellowAccent,
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
                        child: Container(
                          height: 40,
                          width: 40,
                          color: const Color.fromRGBO(250, 250, 250, 0.1),
                          child: GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.search,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
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
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text('Rs.2000',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 19,
                          color: Color.fromARGB(255, 15, 14, 14))),
                ),
                SizedBox(height: 25),
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
                SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Rs.300',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 19,
                              color: Colors.green)),
                      Text('Rs.300',
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
