import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:spendee/db/category_db.dart';
import 'package:spendee/db/transaction_db.dart';

import 'package:spendee/models/transactions/transaction_model.dart';
import 'package:spendee/screens/transactions.dart';
import 'package:spendee/widgets/app_bar.dart';

class SearchWidget extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // for closing the search page and going back
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: TransactionDB().transactionListNotifier,
      builder: ((BuildContext context, List<TransactionModel> transaction,
          Widget? child) {
        return ListView.builder(
          itemBuilder: (ctx, index) {
            final data = transaction[index];

            if (data.category
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase())) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) {
                            return const Transactions();
                          }),
                        ),
                      );
                    },
                    title: Text(data.category.toString()),
                  ),
                  const Divider()
                ],
              );
            } else {
              return Container(
                child: Text('No results'),
              );
            }
          },
          itemCount: transaction.length,
        );
      }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: TransactionDB().transactionListNotifier,
      builder: ((BuildContext context, List<TransactionModel> transaction,
          Widget? child) {
        print(transaction);
        return ListView.builder(
          itemBuilder: (ctx, index) {
            final data = transaction[index];
            if (data.category
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase())) {
              //if (data.name.contains(query)) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) {
                            return Transactions();
                            /* DisplayStudent(
                                name: data.name,
                                age: data.age,
                                address: data.address,
                                number: data.phnNumber,
                                index: index,
                                photo: data.photo); */
                          }),
                        ),
                      );
                    },
                    title: Text(data.category.toString()),
                    /* leading: CircleAvatar(
                      backgroundImage: FileImage(File(data.photo)),
                    ), */
                  ),
                  const Divider()
                ],
              );
            } else {
              return Container();
            }
          },
          itemCount: transaction.length,
        );
      }),
    );
  }
}
