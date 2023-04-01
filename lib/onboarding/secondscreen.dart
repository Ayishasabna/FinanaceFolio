import 'package:flutter/material.dart';
import 'package:spendee/screens/login.dart';
import 'package:spendee/onboarding/third_screen.dart';
import 'package:spendee/widgets/button.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double screenHeight = size.height;
    final double imageHeight = size.height * .5;
    final double textSize = size.width * 0.05;
    final double buttonWidth = size.width * 0.3;
    final double buttonHeight = size.height * 0.05;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: imageHeight,
              child: Image.asset('assets/images/secondpic.png'),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              '"Never Spend your\nmoney before\n you have it"',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * .08),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.1
                      //40
                      ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    child: button(buttonWidth, buttonHeight, 'Skip', textSize),
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.1),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ThirdScreen()),
                      );
                    },
                    child: button(buttonWidth, buttonHeight, 'Next', textSize),
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
