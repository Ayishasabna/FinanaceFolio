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
    final double buttonWidth = size.width * 0.3;
    final double buttonHeight = size.height * 0.05;
    final double textSize = size.width * 0.05;

    final double imageHeight = size.height * .5;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: imageHeight,
              child: Image.asset(
                'assets/images/thirdpic.png',
                height: screenHeight * 0.4,
                width: screenWidth * 0.8,
              ),
            ),
            //SizedBox(height: screenHeight * .04),
            Container(
              padding: EdgeInsets.only(top: screenHeight * 0.05),
              width: screenWidth * 0.7,
              height: screenHeight * 0.25,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(199, 12, 12, 0.88),
                  Color.fromRGBO(255, 67, 40, 0.88),
                  Color.fromRGBO(255, 152, 100, 0.88),
                ]),
              ),
              child: Text(
                '"Money moves from\nthose who do not\nmanage it to those\nwho do."',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: textSize,
                  //24,
                ),
              ),
            ),
            SizedBox(height: screenHeight * .03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.1),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
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
                        MaterialPageRoute(builder: (context) => const Login()),
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
