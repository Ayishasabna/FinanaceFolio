import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spendee/onboarding/first_screen.dart';
import 'package:spendee/widgets/bottomnavigation.dart';
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
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Image.asset(
        'assets/images/iconmoneymanager.png',
        //'assets/images/image.jpg',
        height: 300,
      ),
    ));
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> gotoLogin() async {
    Future.delayed(
      const Duration(seconds: 4),
    );
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (ctx) => const FirstScreen()),
    );
  }

  Future<void> checkUserLoggedIn() async {
    final sharedpref = await SharedPreferences.getInstance();
    final userLoggedIn = sharedpref.getBool(saveKeyName);
    if (userLoggedIn == null || userLoggedIn == false) {
      gotoLogin();
    } else {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx1) => const BottomNavBar()));
    }
  }
}
