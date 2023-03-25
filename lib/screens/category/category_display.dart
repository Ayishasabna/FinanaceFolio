import 'package:flutter/material.dart';

class CategoryDisplay extends StatefulWidget {
  const CategoryDisplay({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _CategoryDisplayState createState() => _CategoryDisplayState();
}

class _CategoryDisplayState extends State<CategoryDisplay> {
  // ignore: prefer_final_fields
  List<String> _categoryItems = ['health', 'expense ', 'salary '];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _categoryItems.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(_categoryItems[index]),
          onTap: () {
            // do something when a category item is tapped
          },
        );
      },
    );
  }
}
