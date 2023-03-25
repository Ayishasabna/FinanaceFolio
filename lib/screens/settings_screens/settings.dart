import 'package:flutter/material.dart';
import 'package:spendee/screens/settings_screens/about.dart';
import 'package:spendee/screens/settings_screens/privacypolicy.dart';
import 'package:spendee/screens/settings_screens/settings_functions.dart';
import 'package:spendee/screens/settings_screens/termsandconditions.dart';
import 'package:spendee/widgets/app_bar.dart';
import 'package:share_plus/share_plus.dart';

TextEditingController limitchangecontroller = TextEditingController();

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appbar('Settings', false),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      editLimit(context);
                    },
                    child: const Icon(
                      Icons.warning,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text(
                    'Change Limit',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 19,
                        color: Color.fromARGB(255, 11, 11, 11)),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const About()));
                    },
                    child: const Icon(
                      Icons.info_outline,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text(
                    'About',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 19,
                        color: Color.fromARGB(255, 11, 11, 11)),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      resetApp(context);
                    },
                    child: const Icon(
                      Icons.restore,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text(
                    'Reset',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 19,
                        color: Color.fromARGB(255, 11, 11, 11)),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Share.share('hey! check out this new app......');
                    },
                    child: const Icon(
                      Icons.share,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text(
                    'Share',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 19,
                        color: Color.fromARGB(255, 11, 11, 11)),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Terms()));
                    },
                    child: const Icon(
                      Icons.document_scanner_outlined,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text(
                    'Terms&Conditions',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 19,
                        color: Color.fromARGB(255, 11, 11, 11)),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const PrivacyPolicy()));
                    },
                    child: const Icon(
                      Icons.privacy_tip_outlined,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text(
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
