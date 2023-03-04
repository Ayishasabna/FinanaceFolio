import 'package:flutter/material.dart';
import 'package:spendee/widgets/app_bar.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey,
          appBar: appbar('About', true, Icons.info_outline),
          body: Center(
            child: Container(
              width: 250,
              height: 300,
              color: Colors.amber,
              child: Material(
                borderRadius: BorderRadius.circular(20),
                elevation: 10,
                shadowColor: Colors.white,
                child: Column(
                  children: [
                    Title(
                        color: Colors.black,
                        child: const Padding(
                          padding: EdgeInsets.only(top: 30, left: 10),
                          child: Text(
                            'Money Manager',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                        )),
                    const SizedBox(
                      height: 40,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15, right: 10),
                      child: Text(
                        '"This is an app where you can add your daily transactions according to the category which it belongs to."',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          'Developed by',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Ayisha sabna.T',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
