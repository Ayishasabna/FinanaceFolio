import 'package:flutter/material.dart';
import 'package:spendee/data/listdata.dart';
import 'package:spendee/screens/add_category.dart';
import 'package:spendee/screens/search.dart';
import 'package:spendee/widgets/button.dart';

class category extends StatelessWidget {
  const category({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
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
                              return ListTile(
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.asset(
                                        'assets/images/${geter()[index].image!}',
                                        height: 60),
                                  ),
                                  minLeadingWidth: 50,
                                  dense: true,
                                  title: Text(
                                    geter()[index].name!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 15, 14, 14)),
                                  ),
                                  trailing: const Icon(
                                    Icons.delete_outlined,
                                    color: Colors.red,
                                  ));
                            },
                            childCount: geter().length,
                          ))
                        ],
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const add_category()),
                    );
                  },
                  child: button(120, 50, 'Add', 18),
                ),
                const SizedBox(
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
