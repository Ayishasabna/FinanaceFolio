import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spendee/db/income_expence.dart';
import 'package:spendee/widgets/button.dart';

TextEditingController limitController = TextEditingController();
// ignore: prefer_typing_uninitialized_variables
var limit;
// ignore: prefer_typing_uninitialized_variables
var expense1;

class Limit extends StatefulWidget {
  const Limit({
    Key? key,
  }) : super(key: key);

  @override
  State<Limit> createState() => _LimitState();
}

class _LimitState extends State<Limit> {
  DateTime? startDate, endDate;

  @override
  void initState() {
    super.initState();
    new1();
  }

  void new1() async {
    final sharedPref = await SharedPreferences.getInstance();
    var limitvariable = sharedPref.getString('limit');
    limitController.text = limitvariable!;
  }

  @override
  Widget build(BuildContext context) {
    // print('limitpage');
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(247, 22, 22, 0.878),
              Color.fromRGBO(255, 67, 40, 0.88),
              Color.fromRGBO(255, 152, 100, 0.88),
            ]),
          ),
        ),
        title: const Center(
          child: Text('Limit'),
        ),
      ),
      body: SingleChildScrollView(
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding:
                      //const EdgeInsets.symmetric(horizontal: 15, vertical: 100),
                      const EdgeInsets.only(top: 200),
                  child: SizedBox(
                    width: 300,
                    child: TextField(
                      //focusNode: ex,
                      controller: limitController,

                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        labelText: 'Enter Limit',
                        labelStyle:
                            const TextStyle(fontSize: 17, color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(width: 2, color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                width: 2, color: Colors.green)),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  limit = limitController.text;
                  Navigator.of(context).pop();
                  expense1 = expense();

                  if (int.parse(limit) <= expense1) {}
                  checkLogin(context);
                },
                child: button(120, 50, 'Save', 17),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext ctx) async {
    var limit = limitController.text;
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString('limit', limit);
    //var limitvariable = sharedPref.getString('limit');
  }
}
