import 'package:flutter/material.dart';
import 'package:spendee/data/utility.dart';
import 'package:spendee/db/category/category_db.dart';
import 'package:spendee/models/category/category_model.dart';
import 'package:spendee/models/transactions/add_data.dart';
import 'package:spendee/screens/category.dart';
import 'package:spendee/screens/home_screen.dart';
import 'package:spendee/widgets/bottomnavigation.dart';
import 'package:spendee/widgets/button.dart';

class add_category extends StatefulWidget {
  const add_category({super.key});

  @override
  State<add_category> createState() => _add_categoryState();
}

class _add_categoryState extends State<add_category> {
  DateTime date = DateTime.now();
  String? selecteditem;
  String? selecteditemi;
  final _formKey = GlobalKey<FormState>();
  final _nameOfCategory = TextEditingController();
  //final _categoryimage = TextEditingController();
//final _categoryimage = selecteditem;

  final List<String> _item = ['food', 'transportation', 'health', 'education'];

  void initstate() {
    super.initState();
    _nameOfCategory.addListener(() {
      setState(() {});
    });
    /*  _categoryimage.addListener(() {
      setState(() {});
    }); */
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
              height: 50,
            ),
            image(),
            const SizedBox(
              height: 50,
            ),
            date_time(),
            const SizedBox(
              height: 30,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  print('hai');
                  //checkLogin(context);
                  var add = CategoryModel(
                    id: '_formKey',
                    name: _nameOfCategory.text,
                    image: selecteditem!,
                    //image: _categoryimage.text
                  );
                  box1.add(add);
                  //print(selecteditem);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Bottom_NavBar()));
                } else {
                  print('data empty');
                }

                /* final _sample = CategoryModel(
                    id: DateTime.now().microsecondsSinceEpoch.toString(),
                    name: 'hh',
                    type: CategoryType.expense); */
                //CategoryDB().insertCategory(_sample).then((value) {});
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

  Padding image() {
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
                      ],
                    ))
                //return [];
                .toList(),
            hint: const Text(
              'Image',
              style: TextStyle(color: Colors.grey),
            ),
            dropdownColor: Colors.white,
            isExpanded: true,
            // underline: Container(),
            onChanged: ((value) {
              setState(() {
                selecteditem = value!;
                print(selecteditem);
              });
            }),
          )),
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

            setState(() {
              date = newDate!;
            });
          },
          child: Text(
            'Date : ${date.year}/${date.month}/${date.day}',
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
        ));
  }

  Padding explain() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        width: 300,
        child: TextField(
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
      child: SizedBox(
        width: 300,
        child: TextField(
          controller: _nameOfCategory,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            labelText: 'Enter Category Name',
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
                      'Add Category',
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
