import 'package:flutter/material.dart';
import 'package:spendee/screens/login.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Image.asset('assets/images/thirdpic.png'),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              width: 250,
              height: 150,
              child: Text(
                '    Money moves from\n      those who do not\n    manage it to those\n              who do.',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              decoration: BoxDecoration(
                gradient: new LinearGradient(colors: [
                  Color.fromRGBO(199, 12, 12, 0.88),
                  Color.fromRGBO(255, 67, 40, 0.88),
                  Color.fromRGBO(255, 152, 100, 0.88)
                ]),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //Padding(padding: EdgeInsets.only(left: 20)),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text('skip'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)))),
                SizedBox(
                  width: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Text('Next'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
