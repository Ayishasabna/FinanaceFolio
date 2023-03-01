import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:spendee/screens/about.dart';
import 'package:spendee/screens/privacypolicy.dart';
import 'package:spendee/screens/reset.dart';
import 'package:spendee/screens/share.dart';
import 'package:spendee/screens/termsandconditions.dart';

class settings extends StatelessWidget {
  const settings({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
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
                      Icons.info,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 20,
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
                    width: 20,
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
                    width: 20,
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
                      Icons.edit_document,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 20,
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
                      Icons.privacy_tip,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 20,
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
