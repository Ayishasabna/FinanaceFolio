import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spendee/screens/first_screen.dart';
import 'package:spendee/screens/home_screen.dart';

import '../main.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    checkUserLoggedIn();
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Image.asset(
        'assets/images/image.jpg',
        height: 300,
      ),
    ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> gotoLogin() async {
    Future.delayed(
      const Duration(seconds: 3),
    );
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (ctx) => FirstScreen()),
    );
  }

  Future<void> checkUserLoggedIn() async {
    final sharedpref = await SharedPreferences.getInstance();

    final userLoggedIn = sharedpref.getBool(SAVE_KEY_NAME);
    if (userLoggedIn == null || userLoggedIn == false) {
      gotoLogin();
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => Home()));
    }
  }
}
