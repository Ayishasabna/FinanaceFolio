import 'package:flutter/material.dart';
import 'package:spendee/db/income_expence.dart';
import 'package:spendee/db/category_db.dart';
import 'package:spendee/models/category/category_model.dart';
import 'package:spendee/screens/category/add_category.dart';
import 'package:spendee/widgets/button.dart';
import 'package:spendee/widgets/uppercase.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => CategoryState();
}

class CategoryState extends State<Category> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // CategoryDB.instance.getAllCategory();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: CategoryNotifier,
        // CategoryNotifier,
        builder: (BuildContext ctx, List<CategoryModel> categoryList,
            Widget? child) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                actions: <Widget>[
                  IconButton(
                      onPressed: () {
                        /* showSearch(
                          context: context,
                          delegate: SearchWidget(),
                        ); */
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
                automaticallyImplyLeading: false,
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
                                    //return getCategories();
                                    var model =
                                        categoryDB.values.toList()[index];

                                    return get(index, model);
                                  },
                                  childCount: categoryDB.length,
                                ),
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
                                builder: (context) => const AddCategory()),
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
    //print(model.image);
    return ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 50,
          child: Image.asset(
            'assets/images/image/${model.categoryImage}.png',
            height: 30,
            width: 30,
          ),
        ),
        title: Text(
          model.categoryName.capitalize(),
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
              color: Color.fromARGB(255, 15, 14, 14)),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 20,
            ),
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
                              CategoryDB.instance.deleteCategory(model.key);
                              //CategoryDB().deleteCategory(model.key);
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
          ],
        ));
  }

  popoutfuction(BuildContext context) {
    return Navigator.of(context).pop();
  }
}
