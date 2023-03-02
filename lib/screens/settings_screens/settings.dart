import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:spendee/screens/settings_screens/about.dart';
import 'package:spendee/screens/settings_screens/privacypolicy.dart';
import 'package:spendee/screens/settings_screens/reset.dart';
import 'package:spendee/screens/settings_screens/share.dart';
import 'package:spendee/screens/settings_screens/termsandconditions.dart';

class settings extends StatelessWidget {
  const settings({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: new LinearGradient(colors: [
                Color.fromRGBO(199, 12, 12, 0.88),
                Color.fromRGBO(255, 67, 40, 0.88),
                Color.fromRGBO(255, 152, 100, 0.88)
              ]),
            ),
          ),
          //backgroundColor: Colors.amber,
          title: Text('Settings'),
          //automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => About()));
                    },
                    child: Icon(
                      Icons.info_outline,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'About',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 19,
                        color: Color.fromARGB(255, 11, 11, 11)),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Reset()));
                    },
                    child: Icon(
                      Icons.restore,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Reset',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 19,
                        color: Color.fromARGB(255, 11, 11, 11)),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => share()));
                    },
                    child: Icon(
                      Icons.share,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Share',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 19,
                        color: Color.fromARGB(255, 11, 11, 11)),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Terms()));
                    },
                    child: Icon(
                      Icons.document_scanner_outlined,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Terms&Conditions',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 19,
                        color: Color.fromARGB(255, 11, 11, 11)),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PrivacyPolicy()));
                    },
                    child: Icon(
                      Icons.privacy_tip_outlined,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Privacy Policy',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 19,
                        color: Color.fromARGB(255, 11, 11, 11)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
