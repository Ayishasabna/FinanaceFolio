import 'package:flutter/material.dart';
import 'package:spendee/screens/login.dart';
import 'package:spendee/screens/third_screen.dart';
import 'package:spendee/widgets/button.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Image.asset('assets/images/secondpic.png'),
            const SizedBox(
              height: 50,
            ),
            const Text(
              '"Never Spend your\nmoney before\n you have it"',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 80,
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
                        MaterialPageRoute(builder: (context) => Login()),
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
                        MaterialPageRoute(
                            builder: (context) => const ThirdScreen()),
                      );
                    },
                    child: button(70, 30, 'Next', 18),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
