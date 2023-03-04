import 'package:flutter/material.dart';
import 'package:spendee/widgets/app_bar.dart';

class Terms extends StatelessWidget {
  const Terms({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: appbar(
              'Terms & Conditins', true, Icons.document_scanner_outlined),
          body: Column(
            children: [
              Title(
                  color: Colors.black,
                  child: Text(
                    'Money Manager',
                    style: TextStyle(fontSize: 17),
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                  'These terms and conditions outline the rules and regulations for the use of money manager.By using this app we assume that you accept these terms and conditins.')
            ],
          )

          /* Text(
            'Welcome to Money Manager\nThese terms and conditions outline the rules and regulations for the use of money manager.By using this app we assume that you accept these terms and conditins'), */
          ),
    );
  }
}
