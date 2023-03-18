import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:spendee/data/utility.dart';
import 'package:spendee/db/category_db.dart';
import 'package:spendee/db/transaction_db.dart';
import 'package:spendee/models/transactions/transaction_model.dart';
import 'package:spendee/screens/transactionlist.dart';
import 'package:spendee/screens/transactions.dart';

class SearchField extends StatefulWidget {
  SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  TextEditingController _searchQueryController = TextEditingController();

  // ValueNotifier<List<TransactionModel>> overViewListNotifier =
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        elevation: 9,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextField(
            controller: _searchQueryController,
            onChanged: (query) {
              //print('$query');
              searchResult(query);
              // overViewListNotifier.notifyListeners();
            },
            decoration: InputDecoration(
                hintText: 'Search..',
                border: InputBorder.none,
                icon: const Icon(
                  Icons.search,
                  // color: textClr,
                ),
                suffixIcon: IconButton(
                    onPressed: () {
                      overViewListNotifier.value =
                          TransactionDB.instance.transactionListNotifier.value;
                      _searchQueryController.clear();
                    },
                    icon: const Icon(
                      Icons.close,
                      // color: Colors.black,
                    ))),
          ),
        ),
      ),
    );
  }

  searchResult(String query) {
    //debugPrint('queryprinted  $query');
    if (query.isEmpty || query == '') {
      debugPrint(query);
      //print(query);
      overViewListNotifier.value =
          TransactionDB.instance.transactionListNotifier.value;
    } else {
      // overViewListNotifier.value.map((e) => debugPrint(e.purpose));

      overViewListNotifier.value = overViewListNotifier.value
          .where((element) =>
              element.category.categoryName
                  .toLowerCase()
                  .contains(query.trim().toLowerCase()) ||
              element.explain.contains(query.trim().toLowerCase()))
          .toList();

      //TransactionDB().transactionListNotifier.notifyListeners();

      //data.category.name.toString().toLowerCase().contains(query.toLowerCase()) || data.purpose.toLowerCase().contains(query.toLowerCase())
    }
  }
}
