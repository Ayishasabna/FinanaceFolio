import 'package:flutter/material.dart';
import 'package:spendee/screens/home_screen.dart';
import 'package:spendee/screens/login.dart';
import 'package:spendee/screens/secondscreen.dart';
import 'package:spendee/screens/statitics.dart';
import 'package:spendee/widgets/bottomnavigation.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 400,
            width: 500,
            decoration: BoxDecoration(
                gradient: new LinearGradient(colors: [
                  Color.fromRGBO(199, 12, 12, 0.88),
                  Color.fromRGBO(255, 67, 40, 0.88),
                  Color.fromRGBO(255, 152, 100, 0.88)
                ]),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))

                /* borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ), */
                //color: Color.fromARGB(255, 243, 83, 72),
                ),
            child: SizedBox(
              height: 50,
              width: 50,
              child: Padding(
                padding: const EdgeInsets.all(70.0),
                child: Container(
                  height: 70,
                  width: 70,
                  padding: EdgeInsets.only(left: 70, right: 70),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/images/Vector.png'),
                  )),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 70,
          ),
          const Text(
            "Let's \n Manage\n  money with us",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 30,
                shadows: <Shadow>[
                  Shadow(
                      offset: Offset(3, 3), blurRadius: 1.0, color: Colors.grey)
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: SizedBox(
              height: 40,
              width: 150,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondScreen()),
                      //builder: (context) => const Bottom_NavBar()),
                    );
                  },
                  child: const Text(
                    'Get started',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 240, 75, 64)),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
