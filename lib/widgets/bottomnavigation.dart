import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:spendee/screens/add.dart';
import 'package:spendee/screens/category.dart';
import 'package:spendee/screens/home_screen.dart';
import 'package:spendee/screens/settings.dart';
import 'package:spendee/screens/statitics.dart';

class Bottom_NavBar extends StatefulWidget {
  const Bottom_NavBar({super.key});

  @override
  State<Bottom_NavBar> createState() => _Bottom_NavBarState();
}

class _Bottom_NavBarState extends State<Bottom_NavBar> {
  int index_color = 0;
  List Screen = [Home(), category(), Statitics(), settings()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen[index_color],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Add_Screen()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.amber,
        /*  child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: new LinearGradient(colors: [
              Color.fromRGBO(199, 12, 12, 0.88),
              Color.fromRGBO(255, 67, 40, 0.88),
              Color.fromRGBO(255, 152, 100, 0.88)
            ]),
          ),
          child: Icon(Icons.add),
        ), */
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.only(top: 7.5, bottom: 7.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                  onTap: () {
                    setState(() {
                      index_color = 0;
                    });
                  },
                  child: Icon(Icons.home,
                      size: 30,
                      color:
                          index_color == 0 ? Color(0xff368983) : Colors.grey)),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      index_color = 1;
                    });
                  },
                  child: Icon(
                    Icons.category,
                    size: 30,
                    color: index_color == 1 ? Color(0xff368983) : Colors.grey,
                  )),
              SizedBox(width: 20),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      index_color = 2;
                    });
                  },
                  child: Icon(
                    Icons.insert_chart,
                    size: 30,
                    color: index_color == 2 ? Color(0xff368983) : Colors.grey,
                  )),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      index_color = 3;
                    });
                  },
                  child: Icon(
                    Icons.settings,
                    size: 30,
                    color: index_color == 3 ? Color(0xff368983) : Colors.grey,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
