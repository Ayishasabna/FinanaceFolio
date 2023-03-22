import 'package:flutter/material.dart';
import 'package:spendee/screens/login.dart';
import 'package:spendee/widgets/button.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;
    final double scaleFactor = size.aspectRatio;
    final double buttonWidth = size.width * 0.3;
    final double buttonHeight = size.height * 0.05;
    final double textSize = size.width * 0.05;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Image.asset(
              'assets/images/thirdpic.png',
              height: screenHeight * 0.4,
              width: screenWidth * 0.8,
            ),
            const SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(top: screenHeight * 0.05),
              width: screenWidth * 0.6,
              height: screenHeight * 0.25,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(199, 12, 12, 0.88),
                  Color.fromRGBO(255, 67, 40, 0.88),
                  Color.fromRGBO(255, 152, 100, 0.88),
                ]),
              ),
              child: const Text(
                '    Money moves from\n      those who do not\n    manage it to those\n              who do.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.1),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: button(
                      buttonWidth,
                      buttonHeight,
                      'Skip',
                      textSize,
                    ),
                  ),
                ),
                const SizedBox(width: 40),
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.1),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: button(
                      buttonWidth,
                      buttonHeight,
                      'Next',
                      textSize,
                    ),
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



/* class ThirdScreen extends StatelessWidget {
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
                        MaterialPageRoute(builder: (context) => Login()),
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
} */
