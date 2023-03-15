import 'package:flutter/material.dart';
import 'package:spendee/data/utility.dart';
import 'package:spendee/models/category/category_model.dart';

import 'package:spendee/screens/home_screen.dart';
import 'package:spendee/widgets/button.dart';

class EditTransaction extends StatefulWidget {
  final String name;
  final String explain;
  final String amount;
  final String finanace;
  final String date_time;
  final int index;

  const EditTransaction({
    super.key,
    required this.name,
    required this.explain,
    required this.amount,
    required this.finanace,
    required this.date_time,
    required this.index,
  });

  @override
  State<EditTransaction> createState() => _EditTransactionState();
}

class _EditTransactionState extends State<EditTransaction> {
  DateTime date1 = DateTime.now();
  String? selecteditem;
  String? selecteditemi;

  final _formKey = GlobalKey<FormState>();

  TextEditingController _name = TextEditingController();
  TextEditingController explain_c = TextEditingController();
  TextEditingController amount_c = TextEditingController();
  TextEditingController finanac = TextEditingController();
  TextEditingController date = TextEditingController();

  final List<String> _iteminex = ['income', 'expense'];

  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    //_name = TextEditingController(text: widget.name);
    //_name.text = _name.toString();
    _name.text = selecteditemi.toString();

    //_dropdownController.text = selecteditemi;
    explain_c = TextEditingController(text: widget.explain);
    amount_c = TextEditingController(text: widget.amount);
    finanac = TextEditingController(text: widget.finanace);
    date = TextEditingController(text: widget.date_time);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
          child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          background_container(context),
          Positioned(
            top: 120,
            child: Container(
              child: main_container(),
            ),
          )
        ],
      )),

      /* appBar: AppBar(
        title: const Text('Edit'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    const Text(
                      'Edit transaction ',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _name,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '',
                        labelText: 'Name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required Name';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      // maxLength: 2,
                      controller: explain_c,
                      keyboardType: TextInputType.number,

                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter note',
                        labelText: 'explain',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required Age';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: amount_c,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your address',
                        labelText: 'amount',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required Address';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      //maxLength: 10,
                      controller: finanac,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter finanace',
                        labelText: 'finanace',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required Number';
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      //maxLength: 10,
                      controller: date,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter date',
                        labelText: 'date',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              //checkLogin(context);

                              var add = Add_Data(
                                  _name.text,
                                  amount_c.text,
                                  DateTime.parse(date.text),
                                  explain_c.text,
                                  finanac.text);

                              Navigator.of(context).pop();
                            } else {
                              print('data empty');
                            }
                          },
                          icon: const Icon(Icons.check),
                          label: const Text('Save'),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ), */
    );
  }

  Container main_container() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      height: 550,
      width: 340,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            name(),
            const SizedBox(
              height: 30,
            ),
            explain(),
            const SizedBox(
              height: 30,
            ),
            Amount(),
            const SizedBox(
              height: 30,
            ),
            finance(),
            const SizedBox(
              height: 30,
            ),
            date_time(),
            const SizedBox(
              height: 30,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                if (_formKey.currentState!.validate()) {}
              },
              child: button(120, 50, 'Save', 18),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Container date_time() {
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
                initialDate: date1,
                firstDate: DateTime(2020),
                lastDate: DateTime(2100));
            if (newDate == Null) return;
            setState(() {
              //date = newDate!;
            });
          },
          child: Text('hai'
              //'Date : ${date.year}/${date.month}/${date.day}',
              /* style: const TextStyle(
                fontSize: 16,
                //fontWeight: FontWeight.normal,
                color: Colors.black), */
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
            value: selecteditemi,

            onChanged: ((value) {
              setState(() {
                selecteditemi = value!;
              });
            }),

            items: _iteminex
                .map((e) => DropdownMenuItem(
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            child: Image.asset('assets/images/image/$e.png'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            e,
                            style: const TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                      value: e,
                    ))
                .toList(),

            selectedItemBuilder: (BuildContext context) => _iteminex
                .map((e) => Row(
                      children: [
                        Container(
                          width: 40,
                          child: Image.asset('assets/images/image/$e.png'),
                        ),
                        /* const SizedBox(
                          width: 20,
                        ) */
                        Text(
                          e,
                          style: const TextStyle(fontSize: 18),
                        )
                      ],
                    ))
                //return [];
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
                return 'Required Name';
              } else {
                return null;
              }
            },
          )),
    );
  }

  Padding Amount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        width: 300,
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Required Name';
            } else {
              return null;
            }
          },
          keyboardType: TextInputType.number,
          //focusNode: amount,
          controller: amount_c,
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
          //focusNode: ex,
          controller: explain_c,
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
          value: _name.text,
          items: dropdownitems(),
          /*  validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Required Name';
            } else {
              return null;
            }
          }, */
          //value: _name.text,
          onChanged: (value) {
            setState(() {
              selecteditem = _name.text;
              //selecteditem = value!;
            });
          },
        ),
      ),
    );
  }

  List<CategoryModel> get items => model.toList();
  List<DropdownMenuItem<String>> dropdownitems() {
    var boxItems = categoryDB.values.map(
      (item) => DropdownMenuItem<String>(
        value: item.name,
        child: Row(children: [
          Text(item.name),
          Container(
            width: 40,
            child: Image.asset('assets/images/image/${item.image}.png'),
          )
        ]),
        //Text(item.name),
        onTap: () {
          selecteditem = item.name;
        },
      ),
    );
    return boxItems.toList();
  }

  Column background_container(BuildContext context) {
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
                      'Update Transaction',
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
}
