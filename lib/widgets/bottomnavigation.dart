import 'package:flutter/material.dart';
import 'package:spendee/screens/add.dart';
import 'package:spendee/screens/category.dart';
import 'package:spendee/screens/home_screen.dart';
import 'package:spendee/screens/settings_screens/settings.dart';
import 'package:spendee/screens/statitics.dart';

class Bottom_NavBar extends StatefulWidget {
  const Bottom_NavBar({super.key});

  @override
  State<Bottom_NavBar> createState() => _Bottom_NavBarState();
}

class _Bottom_NavBarState extends State<Bottom_NavBar> {
  int index_color = 0;
  List Screen = [Home(), Category(), Statitics(), settings()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen[index_color],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const Add_Screen()));
        },
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromRGBO(255, 67, 40, 0.88),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
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
                      color: index_color == 0 ? Colors.amber : Colors.grey)),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      index_color = 1;
                    });
                  },
                  child: Icon(
                    Icons.category,
                    size: 30,
                    color: index_color == 1 ? Colors.amber : Colors.grey,
                  )),
              const SizedBox(width: 20),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      index_color = 2;
                    });
                  },
                  child: Icon(
                    Icons.insert_chart,
                    size: 30,
                    color: index_color == 2 ? Colors.amber : Colors.grey,
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
                    color: index_color == 3 ? Colors.amber : Colors.grey,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
