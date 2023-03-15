import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:spendee/data/utility.dart';
import 'package:spendee/db/functions/db_functions.dart';
import 'package:spendee/db/transaction_db.dart';
import 'package:spendee/models/transactions/transaction_model.dart';

class Searchfield extends StatelessWidget {
  Searchfield({super.key});
  final TextEditingController _searchQueryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Card(
        elevation: 9,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: TextField(
            controller: _searchQueryController,
            onChanged: (query) {
              searchResult(query);
            },
            decoration: InputDecoration(
                hintText: 'search',
                border: InputBorder.none,
                icon: Icon(Icons.search),
                suffixIcon: IconButton(
                    onPressed: () {
                      //TransactionDB().transactionListNotifier =
                      //TransactionDB.instance.transactionListNotifier.value;
                      // ListNotifier.value = Add_Data.instance.Listnotifier.value;
                      _searchQueryController.clear();
                    },
                    icon: Icon(Icons.close))),
          ),
        ),
      ),
    );
  }

  searchResult(String query) {
    if (query.isEmpty) {
      //transactionListNotifier.value = transactionListNotifier.value
      //  .where((element) => element.name
      //    .toString()
      //  .toLowerCase()
      //.contains(query.trim().toLowerCase()))
      // .toList();
    }
  }
}
