import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

class Add_Screen extends StatefulWidget {
  const Add_Screen({super.key});

  @override
  State<Add_Screen> createState() => _Add_ScreenState();
}

class _Add_ScreenState extends State<Add_Screen> {
  String? selecteditem;
  final List<String> _item = ['food', 'transportation', 'health', 'education'];
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
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 15),
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: Colors.grey,
                    )),
                child: DropdownButton<String>(
                    items: _item
                        .map((e) => DropdownMenuItem(
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    child: Image.asset(
                                        'assets/images/image/${e}.png'),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    e,
                                    style: TextStyle(fontSize: 18),
                                  )
                                ],
                              ),
                              value: e,
                            ))
                        .toList(),
                    selectedItemBuilder: (context) {
                      _item.map((e) => null);
                      return [];
                    },
                    hint: Text(
                      'Name',
                      style: TextStyle(color: Colors.grey),
                    ),
                    dropdownColor: Colors.white,
                    isExpanded: true,
                    underline: Container(),
                    onChanged: ((value) {
                      setState(() {
                        selecteditem = value!;
                      });
                    }))),
          )
        ],
      ),
    );
  }

  Column background_container(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 240,
          decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Column(
            children: [
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        )),
                    /* IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ), */
                    Text(
                      'Adding',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.red),
                    ),
                    Icon(
                      Icons.attach_file_outlined,
                      color: Colors.black,
                    )
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
