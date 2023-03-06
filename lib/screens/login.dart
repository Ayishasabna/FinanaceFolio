import 'package:flutter/material.dart';
import 'package:spendee/widgets/bottomnavigation.dart';
import 'package:spendee/widgets/button.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 250,
                        height: 50,
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          elevation: 10,
                          shadowColor: Colors.white,
                          child: TextFormField(
                            decoration: InputDecoration(
                                isDense: true,
                                //contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                hintText: 'Username'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title:
                                        const Text('Enter the Monthly Limit'),
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
                                });
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
}
