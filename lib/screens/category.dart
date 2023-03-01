import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class category extends StatefulWidget {
  const category({super.key});

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber,
            title: Text('Category'),
            //automaticallyImplyLeading: false,
          ),
          body: Column(
            children: [
              Padding(padding: EdgeInsets.all(10)),
              Expanded(
                  child: ListView.builder(
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
              ))
            ],
          )
          /*  Container(
          height: 100,
          child: ListTile(
            leading: Icon(Icons.abc),
            title: Text('wages'),
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
          ),
        ), */

          /*  Column(
          children: [
            SizedBox(
              height: 200,
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.abc),
                    title: Text('wages'),
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
                itemCount: 6,
              ),
            ),
          ],
        ), */

          /*  body: Container(
          child: Center(
              child:
                  // Text('hai'),
                  ListView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return ListTile(
                //leading:-,
                title: Text('wages'),
                trailing: Row(
                  children: [
                    Icon(Icons.update),
                    Icon(Icons.delete),
                  ],
                ),
              );
            },
            itemCount: 6,
          )),
      
        ), */
          ),
    );
  }
}
