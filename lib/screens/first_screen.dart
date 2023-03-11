import 'package:flutter/material.dart';
import 'package:spendee/screens/secondscreen.dart';
import 'package:spendee/widgets/button.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.5, // use percentage of screen height
              width: size.width * 0.9, // use percentage of screen width
              child: Padding(
                padding: EdgeInsets.all(
                    size.width * 0.05), // use percentage of screen width
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/allocation.png'),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Text(
              "Let's \n Manage\n  money with us",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: size.width * 0.1, // use percentage of screen width
                color: const Color.fromARGB(255, 218, 148, 19),
                shadows: <Shadow>[
                  Shadow(
                    offset: const Offset(1, 1),
                    color: const Color.fromARGB(255, 218, 148, 19),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.1), // use percentage of screen height
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SecondScreen()),
                  );
                },
                child: button(
                    size.width * 0.3,
                    size.height * 0.05,
                    'Get Started',
                    size.width *
                        0.05), // use percentage of screen width and height
              ),
            ),
          ],
        ),
      ),
    );
  }

  /* Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
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
              textAlign: TextAlign.center,
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
            const SizedBox(
              height: 70,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SecondScreen()),
                );
              },
              child: button(120, 50, 'Get Started', 18),
            ),
            const SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }
} */

  /* @override
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
  } */
}
