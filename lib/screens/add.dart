import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:spendee/data/utility.dart';
import 'package:spendee/db/functions/db_functions.dart';
import 'package:spendee/models/category/category_model.dart';
import 'package:spendee/models/transactions/add_data.dart';
import 'package:spendee/screens/category.dart';
import 'package:spendee/screens/home_screen.dart';
import 'package:spendee/widgets/button.dart';

class Add_Screen extends StatefulWidget {
  const Add_Screen({super.key});

  @override
  State<Add_Screen> createState() => _Add_ScreenState();
}

class _Add_ScreenState extends State<Add_Screen> {
  final box = Hive.box<Add_Data>('data');
  DateTime date = DateTime.now();
  String? selecteditem;
  String? selecteditemi;

  final _formKey = GlobalKey<FormState>();
  final _nameOfStudent = TextEditingController();
  final TextEditingController explain_C = TextEditingController();

  FocusNode ex = FocusNode();
  final TextEditingController amount_c = TextEditingController();
  FocusNode amount = FocusNode();

  //final List<String> _item = ['food', 'transportation', 'health', 'education'];

  // var model = box1.values.toList();
  //List<CategoryModel> item =model. ;

  //final List<String> _item = List<String>.from(box1.values);

//var box1 = await Hive.openBox('boxName');
//final box1 = await Hive.openBox<CategoryModel>('category');
/* final category = box1.values.toList();
final _item = category.map((CategoryModel) => CategoryModel.name).toList(); */
//await box.close();

  // final _item =ModelNotifier.map((CategoryModel) => CategoryModel.name).toList();

//final box1 = await Hive.openBox<CategoryModel>('category');
  //final _item = box1.values.toList();

  //final names = categories.map((category) => category.name).toList();

  //final List<String> _item =;
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
            child: main_container(),
          )
        ],
      )),
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
                if (_formKey.currentState!.validate()) {
                  //checkLogin(context);
                  var add = Add_Data(selecteditemi!, amount_c.text, date,
                      explain_C.text, selecteditem!);
                  box.add(add);
                  Navigator.of(context).pop();
                } else {
                  print('data empty');
                }
                //_nameOfStudent.text.isEmpty ? validate = true : _validate = false;
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
                initialDate: date,
                firstDate: DateTime(2020),
                lastDate: DateTime(2100));
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
          child: DropdownButton<String>(
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
                        const SizedBox(
                          width: 10,
                        ),
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
            underline: Container(),
          )),
    );
  }

  Padding Amount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        width: 300,
        child: TextField(
          keyboardType: TextInputType.number,
          focusNode: amount,
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
          focusNode: ex,
          controller: explain_C,
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

  /*  Padding name() {
    //getAllCategory();
    // print(ModelNotifier.value);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      /* child: TextFormField(
        controller: _nameOfStudent,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'name',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Required Name';
          } else {
            return null;
          }
        },
      ), */

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
          
          items: dropdownitems,
          onChanged: ((value) {
            setState(
              () {
                selecteditem = value!;
              },
            );
          }),
        ),

        /* child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white))),
            value: selecteditem,
            items: _item
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
            selectedItemBuilder: (BuildContext context) => _item
                .map((e) => Row(
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
                    ))
                //return [];
                .toList(),
            hint: const Text(
              'Name',
              style: TextStyle(color: Colors.grey),
            ),
            dropdownColor: Colors.white,
            isExpanded: true,
            //underline: Container(),
            onChanged: ((value) {
              setState(
                () {
                  selecteditem = value!;
                },
              );
            }),

            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Required Name';
              } else {
                return null;
              }
            },
          ) */
      ),
    );
  }

  List<DropdownMenuItem<String>> get dropdownitems {
   /*  List<DropdownMenuItem<String>> menuitems = List.generate(
        box1.length,
        (index) => DropdownMenuItem(
            //value: box1.name,
            //value: model.name,
            value: ,
            

            /* value: CategoryModel(
                    id: model.id, name: model.name, image: model.image)
                .toString(), */
            child: Wrap(
              children: [
                Text(model.name),
                /* Text(CategoryModel(
                        id: model.id, name: model.name, image: model.image)
                    .toString()), */
              ],
            ))); */


List<DropdownMenuItem<String>> menuitems = box1.get((item) =>
    DropdownMenuItem<String>(
      value:  item.name,
      child: Text(item.name),
    )
  ).toList();



    return menuitems;
  } */

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
          onChanged: (value) {
            setState(() {
              selecteditem = value!;
            });
          },
        ),
      ),
    );
  }

/* List<DropdownMenuItem<String>> dropdownitems() {
  return box1
      .map(
        (item) => DropdownMenuItem<String>(
          value: item.name,
          child: Text(item.name),
        ),
      )
      .toList();
} */

  /* var model = box1.values.toList();
  List<DropdownMenuItem<String>> dropdownitems() {
  return box1
      .get(
        (item) => DropdownMenuItem<String>(
          value: item.name,
          child: Text(item.name),
        ),
      )
      .toList();
} */
  List<CategoryModel> get items => model.toList();
  List<DropdownMenuItem<String>> dropdownitems() {
    var boxItems = box1.values.map(
      (item) => DropdownMenuItem<String>(
          value: item.name,
          child: Row(children: [
            Text(item.name),
            Container(
              width: 40,
              child: Image.asset('assets/images/image/${item.image}.png'),
            )
          ])
          //Text(item.name),
          ),
    );
    return boxItems.toList();
  }

  /* List<DropdownMenuItem<String>> dropdownitem(
      List<CategoryModel> modelNotifier) {
    List<DropdownMenuItem<String>> menu;
    menu = [
      modelNotifier
      .map((e) => DropdownMenuItem(value: e.name, child: Wrap(
        children: [
          Text(e.name),
        ],
      )))
      .toList(),
    ];
    return menu;
  } */

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
}
