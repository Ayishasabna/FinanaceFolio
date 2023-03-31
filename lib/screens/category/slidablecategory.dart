import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:spendee/models/category/category_model.dart';
import 'package:spendee/widgets/uppercase.dart';

class SlidableCategory extends StatelessWidget {
  const SlidableCategory({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: const ActionPane(motion: StretchMotion(), children: []),
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
          title: Text('${category.categoryName.capitalize()}'),
        ),
      ),
    );
  }
}
