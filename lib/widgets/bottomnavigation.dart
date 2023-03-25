import 'package:flutter/material.dart';
import 'package:spendee/screens/transaction/add_transaction.dart';
import 'package:spendee/screens/category/category.dart';
import 'package:spendee/screens/home_screen.dart';
import 'package:spendee/screens/settings_screens/settings.dart';
import 'package:spendee/statitics/statitics_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int indexColor = 0;
  // ignore: non_constant_identifier_names
  List Screen = [
    const Home(),
    const Category(),
    const Statitics(),
    const Settings()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen[indexColor],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddTransaction()));
        },
        // ignore: sort_child_properties_last
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
                      indexColor = 0;
                    });
                  },
                  child: Icon(Icons.home,
                      size: 30,
                      color: indexColor == 0 ? Colors.amber : Colors.grey)),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      indexColor = 1;
                    });
                  },
                  child: Icon(
                    Icons.category,
                    size: 30,
                    color: indexColor == 1 ? Colors.amber : Colors.grey,
                  )),
              //const SizedBox(width: 20),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      indexColor = 2;
                    });
                  },
                  child: Icon(
                    Icons.insert_chart,
                    size: 30,
                    color: indexColor == 2 ? Colors.amber : Colors.grey,
                  )),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      indexColor = 3;
                    });
                  },
                  child: Icon(
                    Icons.settings,
                    size: 30,
                    color: indexColor == 3 ? Colors.amber : Colors.grey,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
