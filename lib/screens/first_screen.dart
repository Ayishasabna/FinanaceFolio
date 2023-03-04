import 'package:flutter/material.dart';
import 'package:spendee/screens/secondscreen.dart';
import 'package:spendee/widgets/button.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 400,
            width: 500,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/allocation.png'),
                )),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Let's \n Manage\n  money with us",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 35,
                color: Color.fromARGB(255, 218, 148, 19),
                shadows: <Shadow>[
                  Shadow(
                      offset: Offset(1, 1),
                      //blurRadius: .5,
                      color: Color.fromARGB(255, 218, 148, 19))
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondScreen()),
                );
              },
              child: button(120, 50, 'Get Started', 18),
            ),
          ),
        ],
      ),
    );
  }
}
