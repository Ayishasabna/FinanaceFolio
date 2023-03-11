import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spendee/main.dart';
import 'package:spendee/screens/home_screen.dart';
import 'package:spendee/widgets/bottomnavigation.dart';
import 'package:spendee/widgets/button.dart';

/* class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final buttonWidth = screenWidth * 0.4;

    return SafeArea(child: Scaffold(
      body: Builder(builder: (context) {
        return Expanded(
          child: Container(
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Image.asset(
                    'assets/images/smartphone.png',
                    height: screenHeight * 0.2,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: SizedBox(height: screenHeight * 0.1),
                ),
                Flexible(
                  flex: 3,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: screenWidth * 0.8,
                            height: screenHeight * 0.05,
                            child: TextFormField(
                              controller: _usernameController,
                              decoration: InputDecoration(
                                isDense: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                hintText: 'Username',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required Name';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: SizedBox(height: screenHeight * 0.1),
                          ),
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding:
                                  EdgeInsets.only(top: screenHeight * 0.02),
                              child: GestureDetector(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    //checkLogin(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const Bottom_NavBar(),
                                      ),
                                    );
                                  } else {
                                    print('data empty');
                                  }
                                },
                                child: button(buttonWidth, screenHeight * 0.08,
                                    'Login', 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    ));
  }
}
 */

/* class Login extends StatelessWidget {
  Login({super.key});

  final _usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final buttonWidth = screenWidth * 0.4;

    return SafeArea(
      child: Scaffold(
        body: Builder(
          builder: (context) {
            return SingleChildScrollView(
              child: Container(
                height: screenHeight,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.1),
                      child: Image.asset(
                        'assets/images/smartphone.png',
                        height: screenHeight * 0.2,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.1),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: screenWidth * 0.8,
                              height: screenHeight * 0.05,
                              child: TextFormField(
                                controller: _usernameController,
                                decoration: InputDecoration(
                                  isDense: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  hintText: 'Username',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Required Name';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.1),
                            Padding(
                              padding: EdgeInsets.only(top: screenHeight * 0.02),
                              child: GestureDetector(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    //checkLogin(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Bottom_NavBar(),
                                      ),
                                    );
                                  } else {
                                    print('data empty');
                                  }
                                },
                                child: button(context, buttonWidth, screenHeight * 0.08, 'Login', 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
 */

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
    //final buttonWidth = screenWidth * 0.4;
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
                  //width: 250,
                  // height: 50,
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                        isDense: true,

                        //contentPadding: EdgeInsets.zero,
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
                      //checkLogin(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Bottom_NavBar()),
                      );
                    } else {
                      print('data empty');
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

    if (username == _usernameController.text) {
      // print('username and password match');
      //go to home
      final sharedPref = await SharedPreferences.getInstance();
      await sharedPref.setBool(SAVE_KEY_NAME, true);
      print(username);

      Navigator.pushReplacement(
          ctx, MaterialPageRoute(builder: (ctx1) => Bottom_NavBar()));
    }
  }
}




/* class Login extends StatelessWidget {
  Login({super.key});

  final _usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Wrap(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Image.asset('assets/images/smartphone.png'),
                ),
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 250,
                            height: 50,
                            child: TextFormField(
                              controller: _usernameController,
                              decoration: InputDecoration(
                                  isDense: true,

                                  //contentPadding: EdgeInsets.zero,
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
                          const SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: GestureDetector(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  //checkLogin(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Bottom_NavBar()),
                                  );
                                } else {
                                  print('data empty');
                                }

                                /* showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text(
                                            'Enter Monthly Expense Limit'),
                                        content: const TextField(
                                          style: TextStyle(fontSize: 20),
                                          keyboardType: TextInputType.number,
                                        ),
                                        actions: [
                                          Center(
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Bottom_NavBar()),
                                                );
                                              },
                                              style: const ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStatePropertyAll(
                                                          Colors.redAccent)),
                                              child: const Text('Save'),
                                            ),
                                          )
                                        ],
                                      );
                                    }); */
                              },
                              child: button(120, 50, 'Login', 18),
                            ),
                          ),
                        ],
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void checkLogin(BuildContext ctx) async {
    final username = _usernameController.text;

    if (username == 'ayisha') {
      // print('username and password match');
      //go to home
      final sharedPref = await SharedPreferences.getInstance();
      await sharedPref.setBool(SAVE_KEY_NAME, true);

      Navigator.pushReplacement(
          ctx, MaterialPageRoute(builder: (ctx1) => Home()));
    } else {
      //print('username and password does not match');

      final errorMessage = 'Username Password does not match';

      //snackbar

      /*  ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        margin: EdgeInsets.all(10),
        content: Text(errorMessage),
        duration: Duration(seconds: 10),
      )
      ); */
    }
  }
}
 */