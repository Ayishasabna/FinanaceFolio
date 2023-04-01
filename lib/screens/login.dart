import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spendee/main.dart';
import 'package:spendee/widgets/bottomnavigation.dart';
import 'package:spendee/widgets/button.dart';

final _usernameController = TextEditingController();

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //final _usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        // ignore: sized_box_for_whitespace
        child: Container(
          height: screenHeight,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(50),
                child: Image.asset('assets/images/smartphone.png'),
              ),
              const SizedBox(
                height: 80,
              ),
              Form(
                key: _formKey,
                child: SizedBox(
                  width: screenWidth * .6,
                  height: screenHeight * .08,
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.01,
                            horizontal: screenHeight * 0.01),
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
              SizedBox(height: screenHeight * .09),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      checkLogin(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BottomNavBar()),
                      );
                    }
                  },
                  child: button(size.width * 0.3, size.height * 0.05, 'Login',
                      size.width * 0.05),
                  //button(120, 50, 'Login', textSize),
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

    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setBool(saveKeyName, true);
    await sharedPref.setString('username', username);
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        ctx, MaterialPageRoute(builder: (ctx1) => const BottomNavBar()));
  }
}
