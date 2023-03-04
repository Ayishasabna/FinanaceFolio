import 'package:flutter/material.dart';
import 'package:spendee/data/listdata.dart';
import 'package:spendee/screens/search.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
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
            /* actions: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Search()));
                },
                child: const Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 20,
              )
            ], */
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
              child: Text('Transactions'),
            ),
            //automaticallyImplyLeading: false,
          ),
          body: CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildBuilderDelegate(
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
                      ));
                },
                childCount: geter().length,
              ))
            ],
          )),
    );
  }
}
