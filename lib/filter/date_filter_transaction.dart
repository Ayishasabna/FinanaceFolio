import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:spendee/db/transaction_db.dart';
import 'package:spendee/screens/transactionlist.dart';
import 'package:spendee/screens/transactions.dart';

class DateFilterTransaction extends StatefulWidget {
  const DateFilterTransaction({
    Key? key,
  }) : super(key: key);

  @override
  State<DateFilterTransaction> createState() => _DateFilterTransactionState();
}

class _DateFilterTransactionState extends State<DateFilterTransaction> {
  DateTime? startDate, endDate;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: const Icon(
        Icons.calendar_view_day_rounded,
        // size: 0,
        // shadows: <Shadow>[Shadow(color: Colors.white, blurRadius: 15.0)],
      ),
      itemBuilder: (ctx) => [
        PopupMenuItem(
          value: 1,
          child: const Text(
            "All",
          ),
          onTap: () {
            overViewListNotifier.value =
                TransactionDB.instance.transactionListNotifier.value;
            overViewListNotifier.notifyListeners();
            print(overViewListNotifier.value);
            setState(() {
              TransactionDB.instance.getAllTransactions();
            });

            //overViewListNotifier.value =
            //TransactionDB.instance.transactionListNotifier.value;
          },
        ),
        PopupMenuItem(
          value: 2,
          child: const Text(
            "Today",
          ),
          onTap: () {
            overViewListNotifier.value =
                TransactionDB.instance.transactionListNotifier.value;
            overViewListNotifier.value = overViewListNotifier.value
                .where((element) =>
                    element.datetime.day == DateTime.now().day &&
                    element.datetime.month == DateTime.now().month &&
                    element.datetime.year == DateTime.now().year)
                .toList();
          },
        ),
        PopupMenuItem(
            value: 2,
            child: const Text(
              "Yesterday",
            ),
            onTap: () {
              overViewListNotifier.value =
                  TransactionDB.instance.transactionListNotifier.value;
              overViewListNotifier.value = overViewListNotifier.value
                  .where((element) =>
                      element.datetime.day == DateTime.now().day - 1 &&
                      element.datetime.month == DateTime.now().month &&
                      element.datetime.year == DateTime.now().year)
                  .toList();
            }),
        PopupMenuItem(
            value: 2,
            child: const Text(
              "Month",
            ),
            onTap: () {
              overViewListNotifier.value =
                  TransactionDB.instance.transactionListNotifier.value;
              overViewListNotifier.value = overViewListNotifier.value
                  .where((element) =>
                      element.datetime.month == DateTime.now().month &&
                      element.datetime.year == DateTime.now().year)
                  .toList();
            }),
        PopupMenuItem(
            value: 2,
            child: const Text(
              "Date Range",
            ),
            onTap: () {
              showCustomDateRangePicker(context,
                  dismissible: true,
                  minimumDate: DateTime(2010),
                  maximumDate: DateTime.now(),
                  endDate: endDate,
                  startDate: startDate, onApplyClick: (start, end) {
                setState(() {
                  endDate = end;
                  startDate = start;
                });
              }, onCancelClick: () {
                setState(() {
                  endDate = null;
                  startDate = null;
                });
              },
                  backgroundColor: Colors.white,
                  primaryColor: Color.fromARGB(255, 244, 98, 54));
              //print('start date $startDate , end date $endDate');

              overViewListNotifier.value =
                  TransactionDB.instance.transactionListNotifier.value;
              overViewListNotifier.value = overViewListNotifier.value
                  .where((element) =>
                      element.datetime.isAfter(startDate!) &&
                      element.datetime.isBefore(endDate!))
                  .toList();
              startDate = null;
              endDate = null;
            }),

        /* PopupMenuItem(
            value: 2,
            child: const Text(
              "Date Range",
            ),
            onTap: () {
              showCustomDateRangePicker(
                context,
                dismissible: true,
                minimumDate: DateTime(2010),
                maximumDate: DateTime.now(),
                endDate: endDate,
                startDate: startDate,
                onApplyClick: (start, end) {
                  setState(() {
                    endDate = end;
                    startDate = start;
                  });
                },
                onCancelClick: () {
                  setState(() {
                    endDate = null;
                    startDate = null;
                  });
                },
                backgroundColor: Colors.white,
                primaryColor: Colors.white,
              );
              //print('start date $startDate , end date $endDate');

              overViewListNotifier.value =
                  TransactionDB.instance.transactionListNotifier.value;
              overViewListNotifier.value = overViewListNotifier.value
                  .where((element) =>
                      element.datetime.isAfter(startDate!) &&
                      element.datetime.isBefore(endDate!))
                  .toList();
              startDate = null;
              endDate = null;
            }), */
      ],
    );
  }
}