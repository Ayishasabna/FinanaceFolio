import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spendee/db/income_expence.dart';
import 'package:spendee/db/transaction_db.dart';
import 'package:spendee/models/category/category_model.dart';
import 'package:spendee/models/transactions/transaction_model.dart';
import 'package:spendee/widgets/bottomnavigation.dart';
import 'package:spendee/widgets/button.dart';
import 'package:spendee/widgets/limit.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  DateTime date = DateTime.now();

  String? selectedFinanace;

  CategoryModel? selectedCategoryModel;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController explainController = TextEditingController();

  FocusNode ex = FocusNode();
  final TextEditingController amountcontroller = TextEditingController();
  FocusNode amount = FocusNode();

  final List<String> _iteminex = ['income', 'expense'];

  void initstate() {
    super.initState();
    ex.addListener(() {
      setState(() {});
    });
    amount.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    //final double screenWidth = size.width;
    //final double screenHeight = size.height;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
          child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          backgroundContainer(context),
          // ignore: avoid_unnecessary_containers
          Container(
            //width: screenWidth * 0.9,
            child: SingleChildScrollView(child: mainContainer()),
          )
        ],
      )),
    );
  }

  Container mainContainer() {
    final Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      //SizedBox(height: screenHeight * .08),

      /* height: 550,
       width: 340, */

      height: size.height * 0.7,
      width: size.width * 0.9,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            name(),
            const SizedBox(
              height: 20,
            ),
            explain(),
            const SizedBox(
              height: 20,
            ),
            transactionAmount(),
            const SizedBox(
              height: 20,
            ),
            finance(),
            const SizedBox(
              height: 20,
            ),
            dateTime(),
            const SizedBox(
              height: 50,
            ),
            //const Spacer(),
            GestureDetector(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  addTransaction();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Transaction Added Successfully')),
                  );
                }
              },
              child: button(size.width * 0.30, size.height * 0.06, 'Save', 18),
              //child: button(120, 50, 'Save', 18),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Container dateTime() {
    return Container(
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2, color: Colors.grey)),
        width: 300,
        child: TextButton(
          onPressed: () async {
            DateTime? newDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime(2100));
            // ignore: unrelated_type_equality_checks
            if (newDate == Null) return;
            setState(() {
              date = newDate!;
            });
          },
          child: Text(
            'Date : ${date.year}/${date.month}/${date.day}',
            style: const TextStyle(
                fontSize: 16,
                //fontWeight: FontWeight.normal,
                color: Colors.black),
          ),
        ));
  }

  Padding finance() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 2,
                color: Colors.grey,
              )),
          child: DropdownButtonFormField<String>(
            value: selectedFinanace,

            onChanged: ((value) {
              setState(() {
                selectedFinanace = value!;
              });
            }),

            items: _iteminex
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/image/$e.png',
                            width: 30,
                            height: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            e,
                            style: const TextStyle(fontSize: 17),
                          )
                        ],
                      ),
                    ))
                .toList(),

            hint: const Text(
              'Select',
              style: TextStyle(color: Colors.grey),
            ),
            dropdownColor: Colors.white,
            isExpanded: true,
            //underline: Container(),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Select finanace';
              } else {
                return null;
              }
            },
          )),
    );
  }

  Padding transactionAmount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        width: 300,
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Select Amount';
            } else {
              return null;
            }
          },
          keyboardType: TextInputType.number,
          focusNode: amount,
          controller: amountcontroller,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            labelText: 'Amount',
            labelStyle: const TextStyle(fontSize: 17, color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2, color: Colors.black),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2, color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(width: 2, color: Colors.green)),
          ),
        ),
      ),
    );
  }

  Padding explain() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        width: 300,
        child: TextField(
          focusNode: ex,
          controller: explainController,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            labelText: 'explain',
            labelStyle: const TextStyle(fontSize: 17, color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2, color: Colors.black),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2, color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(width: 2, color: Colors.green)),
          ),
        ),
      ),
    );
  }

  Padding name() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: Colors.grey,
          ),
        ),
        child: DropdownButtonFormField<String>(
          items: dropdownitems(),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Select Name';
            } else {
              return null;
            }
          },
          onChanged: (value) {
            setState(() {
              //selectedCategoryModel = value;
            });
          },
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> dropdownitems() {
    var boxItems = categoryDB.values.map(
      (item) => DropdownMenuItem<String>(
        //value: selectedCategoryModel,
        value: item.categoryName,
        child: Row(children: [
          Image.asset(
            'assets/images/image/${item.categoryImage}.png',
            width: 25,
            height: 25,
          ),
          const SizedBox(
            width: 7,
          ),
          Text(
            item.categoryName,
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
          ),
        ]),
        onTap: () {
          selectedCategoryModel = item;
        },
        //Text(item.name),
      ),
    );
    return boxItems.toList();
  }

  Future addTransaction() async {
    if (selectedCategoryModel == null) {
      return;
    }

    final model = TransactionModel(
        // categoryName: name,
        finanace: selectedFinanace!,
        amount: amountcontroller.text,
        datetime: date,
        explain: explainController.text,
        category: selectedCategoryModel!,
        id: DateTime.now().microsecondsSinceEpoch.toString());
    TransactionDB.instance.insertTransaction(model);
    Navigator.of(context).pop();
    TransactionDB.instance.getAllTransactions();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Transaction Added Successfully')),
    );
    final sharedPref = await SharedPreferences.getInstance();
    var limitvariable = sharedPref.getString('limit')!;
    expense1 = expense();
    // ignore: use_build_context_synchronously
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const BottomNavBar()));

    if (int.parse(limitvariable) <= expense1) {
      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text(
                '        Alert: \n Expense cross the limit',
                style: TextStyle(color: Colors.red),
              ),
            );
          });
    }
  }
}

Column backgroundContainer(BuildContext context) {
  return Column(
    children: [
      Container(
        width: double.infinity,
        height: 240,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(199, 12, 12, 0.88),
              Color.fromRGBO(255, 67, 40, 0.88),
              Color.fromRGBO(255, 152, 100, 0.88)
            ]),
            //color: Colors.amber,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    width: 80,
                  ),
                  const Text(
                    'Add Transaction',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    ],
  );
}
