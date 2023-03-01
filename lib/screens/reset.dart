import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Reset extends StatelessWidget {
  const Reset({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Reset'),
        //automaticallyImplyLeading: false,
        actions: const [
          //Padding(padding: EdgeInsets.only(right: 20)),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.restore),
          ),
        ],
      ),
    );
  }
}
