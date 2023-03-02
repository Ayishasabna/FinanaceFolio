import 'package:flutter/material.dart';
import 'package:spendee/screens/add_category.dart';

class category extends StatelessWidget {
  const category({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text('Category'),
          //automaticallyImplyLeading: false,
        ),
        /*  body: ListView.builder(
            itemBuilder: (context, index) {
          return ListTile(
            title: Text('wages'),
            leading: Icon(Icons.abc),
            trailing: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ],
            ),
          );
            },
            itemCount: 4,
          ) */

        body: SafeArea(
          child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return ListTile(
                      //subtitle: Text('Message$index'),
                      //leading: avatar(index),
                      leading: Icon(Icons.abc),
                      title: Text('wages'),
                      /*  trailing: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.edit,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ],
                        ) */
                    );
                  },
                  itemCount: 6,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const add_category()),
                    //builder: (context) => const Bottom_NavBar()),
                  );
                },
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    shadowColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
