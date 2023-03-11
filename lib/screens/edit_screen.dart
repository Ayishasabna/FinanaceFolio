import 'package:flutter/material.dart';
import 'package:spendee/data/utility.dart';
import 'package:spendee/models/transactions/add_data.dart';
import 'package:spendee/screens/home_screen.dart';
import 'package:spendee/widgets/button.dart';

/* class EditTransaction extends StatefulWidget {
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
  //const EditTransaction({super.key});

  @override
  State<EditTransaction> createState() => _EditTransactionState();
}
 */
/* class _EditTransactionState extends State<EditTransaction> {
  TextEditingController _nameOfStudent = TextEditingController();
  TextEditingController explain_c = TextEditingController();
  TextEditingController amount_c = TextEditingController();
  TextEditingController finanac = TextEditingController();
  TextEditingController date = TextEditingController();
  String? selecteditem;
  String? selecteditemi;

  final _formKey = GlobalKey<FormState>();

  final List<String> _item = ['food', 'transportation', 'health', 'education'];
  final List<String> _iteminex = ['income', 'expense'];

  @override
  void initState() {
    super.initState();

    _nameOfStudent = TextEditingController(text: widget.name);
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

                  var add = Add_Data(_nameOfStudent.text, amount_c.text,
                      DateTime.parse(date.text), explain_c.text, finanac.text);
                  //
                  //
                  //box.add(add);
                  Navigator.of(context).pop();
                } else {
                  print('data empty');
                }
              },
              child: button(120, 50, 'Update', 18),
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

      /*  child: GestureDetector(
        
        onTap: () async {
          DateTime? newDate = await showDatePicker(
              context: context,
              initialDate: DateTime.parse('0'),
              firstDate: DateTime(2020),
              lastDate: DateTime(2100));
          if (newDate == Null) return;
          setState(() {
            //date = newDate!;
          });
        
        
        },
        child: TextFormField(
          
          //maxLength: 10,
          controller: date,
          //keyboardType: TextInputType.number,
          decoration: const InputDecoration(
          
            border: OutlineInputBorder(),
            hintText: 'Enter date',
            labelText: 'date',
          ),
           */

      /* onTap: () async {
            DateTime? newDate = await showDatePicker(
                context: context,
                initialDate: DateTime.parse('0'),
                firstDate: DateTime(2020),
                lastDate: DateTime(2100));
            if (newDate == Null) return;
            setState(() {
              //date = newDate!;
            });
          }, */

      /* child: Text(
              'Date : ${date.year}/${date.month}/${date.day}',
              style: const TextStyle(
                  fontSize: 16,
                  //fontWeight: FontWeight.normal,
                  color: Colors.black),
            ), */

      /*  validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required Number';
                          } /* else if (value.length < 10) {
                            return 'invalid phone number';
                          } */ else {
                            return null;
                          }
                        }, */
      // ),
      //),

      /*  child: TextButton(
          onPressed: () async {
            DateTime? newDate = await showDatePicker(
                context: context,
                initialDate: DateTime.parse(date.text),
                firstDate: DateTime(2020),
                lastDate: DateTime(2100));
            if (newDate == Null) return;
            setState(() {
              date.text = newDate!.toString();

              //date = newDate!;
            });
          },
          child: Text(
            'date:$date.text',

            //'Date : ${date.text.year}/${date.month}/${date.day}',
            style: const TextStyle(
                fontSize: 16,
                //fontWeight: FontWeight.normal,
                color: Colors.black),
          ),
        ) */
    );
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
          )),
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
 */

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
  TextEditingController _nameOfStudent = TextEditingController();
  TextEditingController explain_c = TextEditingController();
  TextEditingController amount_c = TextEditingController();
  TextEditingController finanac = TextEditingController();
  TextEditingController date = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _nameOfStudent = TextEditingController(text: widget.name);
    explain_c = TextEditingController(text: widget.explain);
    amount_c = TextEditingController(text: widget.amount);
    finanac = TextEditingController(text: widget.finanace);
    date = TextEditingController(text: widget.date_time);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                      'Edit student details',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _nameOfStudent,
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
                      maxLength: 2,
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
                      maxLength: 10,
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
                        }
                        /*  else if (value.length < 10) {
                          return 'invalid phone number';
                        }  */
                        else {
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
                      /*  validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required Number';
                        } /* else if (value.length < 10) {
                          return 'invalid phone number';
                        } */ else {
                          return null;
                        }
                      }, */
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              //checkLogin(context);

                              var add = Add_Data(
                                  _nameOfStudent.text,
                                  amount_c.text,
                                  DateTime.parse(date.text),
                                  explain_c.text,
                                  finanac.text);
                              //
                              //
                              //box.add(add);
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
      ),
    );
  }
  /*  Future<void> onEditSaveButton(ctx) async {



    
    
    final box = Add_Data(
      name: _nameOfStudent.text,
      age: _ageOfStudent.text,
      phnNumber: _phnOfStudent.text,
      address: _addressOfStudent.text,
      photo: photoPath,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(30),
        backgroundColor: Colors.blueGrey,
        content: Text(
          'Saved',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
    editList(widget.index, box);
  } */
}
