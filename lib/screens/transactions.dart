import 'package:flutter/material.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    builder:
    (ctx, studentModel, Widget? child) {};
    return Scaffold(
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
        //backgroundColor: Colors.red,
        title: Center(
          child: Text('Transactions'),
        ),
        //automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
          itemBuilder: ((context, index) {
            //final data = studentModel[index];
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  /* backgroundImage: FileImage(
                      File(data.photo),
                      ), */
                ),
                //title: Text(data.name),
                trailing: Wrap(
                  spacing: 12, // space between two icons
                  children: <Widget>[
                    IconButton(
                      onPressed: (() {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) {
                              return Text('hello');
                              /*  return EditStudent(
                                    name: data.name,
                                    age: data.age,
                                    address: data.address,
                                    number: data.phnNumber,
                                    index: index,
                                    image: data.photo,
                                  ); */
                            }),
                          ),
                        );
                        // EditStudent();
                      }),
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.blue,
                      ),
                      tooltip: 'Edit',
                    ),

                    IconButton(
                      onPressed: (() {
                        showDialog(
                          context: context,
                          builder: ((context) {
                            return Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: AlertDialog(
                                title: const Text(
                                  'Alert!',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                                content: const Text(
                                  "Do you want to delete this student",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: (() {
                                      popoutfuction(context);
                                      // deleteStudent(index);
                                    }),
                                    child: const Text('Yes'),
                                  ),
                                  TextButton(
                                      onPressed: (() {
                                        popoutfuction(context);
                                      }),
                                      child: const Text('No'))
                                ],
                              ),
                            );
                          }),
                        );
                      }),
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                      ),
                      tooltip: 'Delete',
                    ),
                    // icon-2
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) {
                        return Text('gdfg');
                        /* return DisplayStudent(
                              name: data.name,
                              age: data.age,
                              address: data.address,
                              number: data.phnNumber,
                              index: index,
                              photo: data.photo,
                            ); */
                      }),
                    ),
                  );
                },
              ),
            );
          }),
          /*  separatorBuilder: ((context, index) {
            return const Divider();
          }), */
          //itemCount: studentModel.length);
          itemCount: 6),
    );
  }

  popoutfuction(BuildContext context) {
    return Navigator.of(context).pop();
  }
}
