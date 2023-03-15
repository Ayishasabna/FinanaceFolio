import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spendee/main.dart';
import 'package:spendee/screens/home_screen.dart';
import 'package:spendee/widgets/bottomnavigation.dart';
import 'package:spendee/widgets/button.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final double textSize = size.width * 0.05;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Image.asset('assets/images/smartphone.png'),
              ),
              const SizedBox(
                height: 60,
              ),
              Form(
                key: _formKey,
                child: SizedBox(
                  width: screenWidth * .6,
                  height: screenHeight * .07,
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Username'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required Name';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      checkLogin(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Bottom_NavBar()),
                      );
                    }
                  },
                  child: button(120, 50, 'Login', textSize),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext ctx) async {
    final username = _usernameController.text;

    if (username == 'ayisha') {
      final sharedPref = await SharedPreferences.getInstance();
      await sharedPref.setBool(SAVE_KEY_NAME, true);
      Navigator.pushReplacement(
          ctx, MaterialPageRoute(builder: (ctx1) => Bottom_NavBar()));
    }
  }
}
