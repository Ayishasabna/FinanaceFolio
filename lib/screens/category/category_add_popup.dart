import 'package:flutter/material.dart';

Future<void> showCategoryAddPopup(BuildContext context) async {
  showDialog(
      context: context,
      builder: (ctx) {
        return SimpleDialog(
          title: const Text('Add Category'),
          children: [
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'category name', border: OutlineInputBorder()),
            ),
            ElevatedButton(onPressed: () {}, child: Text('Add'))
          ],
        );
      });
}
