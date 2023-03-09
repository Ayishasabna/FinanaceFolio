import 'package:flutter/material.dart';
import 'package:spendee/data/top.dart';
import 'package:spendee/data/utility.dart';
import 'package:spendee/models/transactions/add_data.dart';
import 'package:spendee/widgets/app_bar.dart';
import 'package:spendee/widgets/chart.dart';

class Statitics extends StatefulWidget {
  const Statitics({super.key});

  @override
  State<Statitics> createState() => _StatiticsState();
}

ValueNotifier kj = ValueNotifier(0);

class _StatiticsState extends State<Statitics> {
  List day = ['Day', 'Week', 'Month', 'Year'];
  List f = [today(), week(), month(), year()];
  List<Add_Data> a = [];
  int index_color = 0;
  //ValueNotifier kj = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appbar('Statitics', true),

        //body: custom(),
        body: ValueListenableBuilder(
            valueListenable: kj,
            builder: (BuildContext context, dynamic value, Widget? child) {
              a = f[value];
              return custom();
            }),
      ),
    );
  }

  CustomScrollView custom() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(4, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            index_color = index;
                            kj.value = index;
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: index_color == index
                                ? Colors.amber
                                : Colors.white,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            day[index],
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: index_color == index
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      );
                    })
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          //SizedBox(width: 10),
                          Flexible(
                            child: Text(
                              'Expense',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          //SizedBox(width: 20),
                          Icon(
                            Icons.arrow_downward_sharp,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Chart(
                indexx: index_color,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Top Spending',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Icon(
                      Icons.swap_vert,
                      size: 25,
                      color: Colors.grey,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) {
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset('assets/images/image/${a[index].name}.png',
                    height: 40),
              ),
              title: Text(
                //geter()[index].name!,
                a[index].name,

                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color: Color.fromARGB(255, 15, 14, 14)),
              ),
              subtitle: Text(
                //geter()[index].time!,
                //history.explain,
                //
                // '${day[history.datetime.weekday-1]} ${history.datetime.year}',
                '${[
                  a[index].datetime.weekday - 1
                ]} ${a[index].datetime.year}-${a[index].datetime.day}-${a[index].datetime.month}',
                //'Date : ${date.year}/${date.month}/${date.day}',
                style: const TextStyle(
                    fontSize: 17, color: Color.fromARGB(255, 15, 14, 14)),
              ),
              trailing: Text(a[index].amount,
                  //geter()[index].fee!,

                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      //color: geter()[index].buy! ? Colors.red : Colors.green
                      color: a[index].IN == 'income' ? Colors.green : Colors.red
                      //Color.fromARGB(255, 15, 14, 14)
                      )),

              /* leading: Image.asset(
                'assets/images/${geter_top()[index].image!}',
                height: 40,
              ),
              title: Text(
                geter_top()[index].name!,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                geter_top()[index].time!,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w500),
              ),
              trailing: Text(
                geter_top()[index].fee!,
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ), */
            );
          },
          childCount: a.length,
        ))
      ],
    );
  }
}
