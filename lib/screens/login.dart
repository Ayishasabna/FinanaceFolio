import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:spendee/widgets/bottomnavigation.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 50, top: 50),
                    height: 400,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: new LinearGradient(colors: [
                          Color.fromRGBO(199, 12, 12, 0.88),
                          Color.fromRGBO(255, 67, 40, 0.88),
                          Color.fromRGBO(255, 152, 100, 0.88)
                        ]),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Column(
                      children: [
                        Image.asset('assets/images/loginpic.png'),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
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
                        elevation: 10,
                        shadowColor: Colors.white,
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              hintText: 'Username'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    /* Align(
                      alignment: Alignment.bottomCenter,
                    ), */
                    SizedBox(
                      //height: 100,
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Bottom_NavBar()),
                            //builder: (context) => const Bottom_NavBar()),
                          );
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            shadowColor: Colors.amber,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    )
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
