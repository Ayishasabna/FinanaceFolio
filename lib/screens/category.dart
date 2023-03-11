import 'package:flutter/material.dart';
import 'package:spendee/data/listdata.dart';
import 'package:spendee/data/utility.dart';
import 'package:spendee/db/category/category_db.dart';
import 'package:spendee/db/functions/db_functions.dart';
import 'package:spendee/models/category/category_model.dart';
import 'package:spendee/screens/add_category.dart';
import 'package:spendee/screens/home_screen.dart';
import 'package:spendee/screens/search.dart';
import 'package:spendee/widgets/button.dart';

class category extends StatefulWidget {
  const category({super.key});

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
  //with SingleTickerProviderStateMixin {
  //late TabController _tabcontroller;
  @override
  /* void initstate() {
    _tabcontroller = TabController(length: 2, vsync: this);
    CategoryDB().getcategories().then((value) {
      print('Categories get');
      print(value);
    });
  } */

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: ModelNotifier,
        builder: (BuildContext ctx, List<CategoryModel> categoryList,
            Widget? child) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                actions: <Widget>[
                  IconButton(
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: SearchWidget(),
                        );
                      },
                      icon: const Icon(Icons.search))
                ],

                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(199, 12, 12, 0.88),
                      Color.fromRGBO(255, 67, 40, 0.88),
                      Color.fromRGBO(255, 152, 100, 0.88)
                    ]),
                  ),
                ),
                backgroundColor: Colors.red,
                title: const Center(
                  child: Text('Category'),
                ),
                //automaticallyImplyLeading: false,
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    Flexible(
                      child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: CustomScrollView(
                            slivers: [
                              SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                    model = box1.values.toList()[index];
                                    return get(index, model);
                                  },
                                  childCount: box1.length,
                                ),

                                /* delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                            'assets/images/${geter()[index].image!}',
                            height: 40),
                      ),
                      title: Text(
                        geter()[index].name!,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Color.fromARGB(255, 15, 14, 14)),
                      ),
                      subtitle: Text(
                        geter()[index].time!,
                        style: const TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 15, 14, 14)),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(geter()[index].fee!,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  color: geter()[index].buy!
                                      ? Colors.red
                                      : Colors.green
                                  //Color.fromARGB(255, 15, 14, 14)
                                  )),
                          const SizedBox(
                            width: 20,
                          ),
                          const Icon(
                            Icons.edit,
                            color: Colors.amber,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),
                        ],
                      )
                      );
                },
                childCount: geter().length,
              ) */
                              )
                            ],
                          )),
                    ),
                    SingleChildScrollView(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const add_category()),
                          );
                        },
                        child: button(120, 50, 'Add', 18),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  ListTile get(int index, CategoryModel model) {
    print(model.image);
    return ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child:
              //Image.asset(model.image),
              //child: Image.asset('assets/images/image/food.png')
              Image.asset(
            'assets/images/image/${model.image}.png',
            height: 40,
          ),
        ),
        title: Text(
          //geter()[index].name!,
          model.name,

          style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
              color: Color.fromARGB(255, 15, 14, 14)),
        ),
        /* subtitle: Text(
          '${[
            model.datetime.weekday - 1
          ]} ${history.datetime.year}-${history.datetime.day}-${history.datetime.month}',
          //'Date : ${date.year}/${date.month}/${date.day}',
          style: const TextStyle(
              fontSize: 17, color: Color.fromARGB(255, 15, 14, 14)),
        ), */
        /* trailing: Text(history.amount,
        //geter()[index].fee!,

        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17,
            //color: geter()[index].buy! ? Colors.red : Colors.green
            color: history.IN == 'income' ? Colors.green : Colors.red
            //Color.fromARGB(255, 15, 14, 14)
            )),
 */

        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            /* Text(history.amount,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color: history.IN == 'income' ? Colors.green : Colors.red
                    //Color.fromARGB(255, 15, 14, 14)
                    )), */
            const SizedBox(
              width: 20,
            ),
            /* IconButton(
              onPressed: (() {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) {
                      return EditTransaction(
                        name: //'ayisha',
                            history.name,
                        explain:
                            //'nnn',
                            history.explain,
                        amount: history.amount,

                        // 21,

                        finanace: history.IN,
                        index: 1,
                        //history.key,
                        date_time: history.datetime.toString(),
                      );
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
            ), */

            /*  const Icon(
              Icons.edit,
              color: Colors.amber,
            ), */
            const SizedBox(
              width: 20,
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
                          "Do you want to delete this category",
                        ),
                        actions: [
                          TextButton(
                            onPressed: (() {
                              popoutfuction(context);
                              deleteCategory(model.key);
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

            /* IconButton(
              onPressed: () {
                if (history != null) {
                  deleteTransaction(history.key);
                } else {
                  print('student id is null.Unable to delete');
                }
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ), */

            /*  GestureDetector(
            key: UniqueKey(),
            onTap: () {
              deleteStudent(history.key);
              //history.delete();

              get(index, history);
            },
            child: const Icon(
              Icons.delete_outline,
              color: Colors.red,
            ),
          ), */
          ],
        ));
  }

  popoutfuction(BuildContext context) {
    return Navigator.of(context).pop();
  }
}
