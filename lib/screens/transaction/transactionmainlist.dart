import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:spendee/db/transaction_db.dart';
import 'package:spendee/models/transactions/transaction_model.dart';
import 'package:spendee/screens/edit.dart';
import 'package:spendee/screens/home_screen.dart';
import 'package:spendee/widgets/uppercase.dart';

class SlidableTransaction extends StatelessWidget {
  const SlidableTransaction({super.key, required this.transaction});

  final TransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: const StretchMotion(), children: [
        SlidableAction(
          onPressed: ((context) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) {
                  return EditTransaction(obj: transaction);
                }),
              ),
            );
          }),
          icon: Icons.edit,
          foregroundColor: const Color(0xFF2E49FB),
        ),
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
                          onPressed: (() async {
                            await TransactionDB()
                                .deleteTransaction(transaction);

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
          //<-- SEE HERE
          // side: BorderSide(width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          //onLongPress: () {},
          leading: CircleAvatar(
            backgroundColor: Color.fromARGB(255, 244, 240, 228),
            radius: 50,
            child: Image.asset(
              'assets/images/image/${transaction.category.categoryImage}.png',
              height: 30,
              width: 30,
            ),
          ),
          title: Text(
            '₹ ${transaction.amount}',
            style: const TextStyle(color: Colors.black),
          ),
          subtitle: Text('${transaction.category.categoryName.capitalize()}'),
          trailing: Text(
            parseDate(transaction.datetime),
          ),
        ),
      ),
    );
  }

  String parseDateTime(DateTime date) {
    final dateFormatted = DateFormat.MMMMd().format(date);
    //using split we split the date into two parts
    final splitedDate = dateFormatted.split(' ');
    //here _splitedDate.last is second word that is month name and other one is the first word
    return "${splitedDate.last}  ${splitedDate.first} ";
  }

  String parseDate(DateTime date) {
    return '${day[date.weekday - 1]}-${date.year} ${DateFormat.MMMd().format(date)}';
  }
}
