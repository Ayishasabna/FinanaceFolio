import 'package:flutter/material.dart';
import 'package:spendee/data/utility.dart';
import 'package:spendee/models/transactions/add_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Chart extends StatefulWidget {
  int indexx;
  Chart({super.key, required this.indexx});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<Add_Data>? a;
  bool b = true;
  bool j = true;
  @override
  Widget build(BuildContext context) {
    switch (widget.indexx) {
      case 0:
        a = today();
        b = true;
        j = true;
        break;
      case 1:
        a = week();
        b = false;
        j = true;
        break;
      case 2:
        a = month();
        b = false;
        j = true;
        break;
      case 3:
        a = year();

        j = false;
        break;

      default:
    }

    return Container(
      width: double.infinity,
      height: 300,
      child: SfCartesianChart(primaryXAxis: CategoryAxis(), series: <
          SplineSeries<SalesData, String>>[
        SplineSeries<SalesData, String>(
          color: Colors.amber,
          //color: Color.fromARGB(255, 47, 125, 121),
          width: 3,
          dataSource: <SalesData>[
            ...List.generate(time(a!, b ? true : false).length, (index) {
              return SalesData(
                  j
                      ? b
                          ? a![index].datetime.hour.toString()
                          : a![index].datetime.day.toString()
                      : a![index].datetime.month.toString(),
                  b
                      ? index > 0
                          ? time(a!, true)[index] + time(a!, true)[index - 1]
                          : time(a!, true)[index]
                      : index > 0
                          ? time(a!, false)[index] + time(a!, false)[index - 1]
                          : time(a!, false)[index]);
            })

            /*  SalesData(100, 'mon'),
                SalesData(20, 'tues'),
                SalesData(40, 'wed'),
                SalesData(50, 'thur'),
                SalesData(10, 'sat'),
                SalesData(5, 'sun'), */
          ],
          xValueMapper: (SalesData sales, _) => sales.year,
          yValueMapper: (SalesData sales, _) => sales.sales,
        )
      ]),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final int sales;
}
