import 'package:flutter/material.dart';
import 'package:spendee/screens/login.dart';
import 'package:spendee/widgets/button.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Image.asset('assets/images/thirdpic.png'),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.only(top: 15),
              width: 250,
              height: 150,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(199, 12, 12, 0.88),
                  Color.fromRGBO(255, 67, 40, 0.88),
                  Color.fromRGBO(255, 152, 100, 0.88)
                ]),
              ),
              child: const Text(
                '    Money moves from\n      those who do not\n    manage it to those\n              who do.',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    child: button(70, 30, 'Skip', 18),
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    child: button(70, 30, 'Next', 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
