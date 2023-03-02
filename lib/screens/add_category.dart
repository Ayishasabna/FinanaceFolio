import 'package:flutter/material.dart';

class add_category extends StatefulWidget {
  const add_category({super.key});

  @override
  State<add_category> createState() => _add_categoryState();
}

class _add_categoryState extends State<add_category> {
  DateTime date = DateTime.now();
  String? selecteditem;
  String? selecteditemi;
  final TextEditingController explain_C = TextEditingController();
  FocusNode ex = FocusNode();

  final TextEditingController amount_c = TextEditingController();
  FocusNode amount = FocusNode();

  final List<String> _item = ['food', 'transportation', 'health', 'education'];
  final List<String> _iteminex = ['Income', 'Expence'];
  @override
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
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          name(),
          const SizedBox(
            height: 50,
          ),
          explain(),
          const SizedBox(
            height: 30,
          ),
          date_time(),
          const SizedBox(
            height: 30,
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(colors: [
                  Color.fromRGBO(199, 12, 12, 0.88),
                  Color.fromRGBO(255, 67, 40, 0.88),
                  Color.fromRGBO(255, 152, 100, 0.88),
                ]),
              ),
              width: 120,
              height: 50,
              child: const Text(
                'save',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
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

  Padding name() {
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
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                    /* IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                         */
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
                    /* Icon(
                      Icons.attach_file_outlined,
                      color: Colors.black,
                    ) */
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
