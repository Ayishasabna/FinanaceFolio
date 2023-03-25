import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:spendee/db/category_db.dart';
import 'package:spendee/models/category/category_model.dart';
import 'package:spendee/widgets/uppercase.dart';

class SlidableCategory extends StatelessWidget {
  const SlidableCategory({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: const StretchMotion(), children: [
        SlidableAction(
          onPressed: ((context) {
            showDialog(
                context: context,
                builder: ((context) {
                  return AlertDialog(
                    content: const Text(
                      'Do you want to Delete?',
                    ),
                    actions: [
                      TextButton(
                          onPressed: (() {
                            //await category.delete();
                            CategoryDB.instance
                                .deleteCategory(category.categoryid);
                            //await CategoryDB().deleteCategory(category);

                            Navigator.of(context).pop();
                          }),
                          child: const Text(
                            'Yes',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          )),
                      TextButton(
                        onPressed: (() {
                          Navigator.of(context).pop();
                        }),
                        child: const Text(
                          'No',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  );
                }));
          }),
          icon: Icons.delete,
          foregroundColor: Colors.red,
        ),
      ]),
      child: Card(
        color: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 244, 240, 228),
            radius: 50,
            child: Image.asset(
              'assets/images/image/${category.categoryImage}.png',
              height: 30,
              width: 30,
            ),
          ),
          // ignore: unnecessary_string_interpolations
          title: Text('${category.categoryImage.capitalize()}'),
        ),
      ),
    );
  }
}
