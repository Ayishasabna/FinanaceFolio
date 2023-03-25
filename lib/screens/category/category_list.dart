import 'package:flutter/material.dart';
import 'package:spendee/db/category_db.dart';
import 'package:spendee/models/category/category_model.dart';
import '../transaction/transactions.dart';
import 'slidablecategory.dart';

//ValueNotifier<List<TransactionModel>> overViewListNotifier =
//ValueNotifier(TransactionDB.instance.CategoryListNotifier.value);

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryDB().getAllCategory();
    return ValueListenableBuilder(
        valueListenable: CategoryDB().categoryNotifier,
        builder: (BuildContext context, newList, Widget? _) {
          return ValueListenableBuilder(
              valueListenable: showCategory,
              builder: (context, showcategorylist, child) {
                //here we building the list using displayList list
                var displayList = [];

                if (showCategory.value == 'income') {
                  //here i am creating an empty list for the transaction,
                  //so i can pick the income only through the where function
                  List<CategoryModel> incomeCategoryList1 = [];
                  //here i converting the element into list using toList function
                  incomeCategoryList1 = newList
                      .where((element) => element.categoryName == 'income')
                      .toList();
                  //assigning the list into displayList which is the list i declared above
                  displayList = incomeCategoryList1;
                } else if (showCategory.value == "Expense") {
                  List<CategoryModel> expenseCategoryList1 = [];
                  expenseCategoryList1 = newList
                      .where((element) => element.categoryName == 'expense')
                      .toList();
                  displayList = expenseCategoryList1;
                } else {
                  displayList = newList;
                }

                return (displayList.isEmpty)
                    ? const SingleChildScrollView(
                        child: Center(
                        child: Text('No categories added yet'),
                      ))
                    : ListView.separated(
                        padding: const EdgeInsets.all(5),
                        itemBuilder: (ctx, index) {
                          /* final int lastIndex = transactionDB.length - 1;
                          final int reversedIndex = lastIndex - index; */

                          //final value = newList[reversedIndex];
                          final category = displayList[index];

                          return SlidableCategory(category: category);
                        },
                        separatorBuilder: (ctx, index) {
                          return const Divider(
                            height: 5,
                            thickness: 5,
                          );
                        },
                        itemCount: displayList.length);
              });
        });
  }
}
