import 'package:flutter/material.dart';
import 'package:spendee/screens/add_category.dart';

class category extends StatelessWidget {
  const category({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: new LinearGradient(colors: [
                  Color.fromRGBO(199, 12, 12, 0.88),
                  Color.fromRGBO(255, 67, 40, 0.88),
                  Color.fromRGBO(255, 152, 100, 0.88)
                ]),
              ),
            ),
            backgroundColor: Colors.red,
            title: Center(
              child: Text('Category'),
            ),
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
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListView.builder(
                      itemBuilder: (ctx, index) {
                        return const ListTile(
                          //subtitle: Text('Message$index'),
                          //leading: avatar(index),
                          leading: Icon(Icons.abc),
                          title: Text('wages'),
                          trailing: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),

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
                    /*  style: ElevatedButton.styleFrom(
                  
                      backgroundColor: Colors.amber,
                      shadowColor: Colors.amber,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))), */

                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 240, 75, 64)),
                    )),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
