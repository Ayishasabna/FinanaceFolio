import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: 300,
        child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            series: <SplineSeries<SalesData, String>>[
              SplineSeries<SalesData, String>(
                dataSource: <SalesData>[
                  SalesData(100, 'mon'),
                  SalesData(20, 'tues'),
                  SalesData(40, 'wed'),
                  SalesData(50, 'thur'),
                  SalesData(10, 'sat'),
                  SalesData(5, 'sun'),
                ],
                xValueMapper: (SalesData sales, _) => sales.year,
                yValueMapper: (SalesData sales, _) => sales.sales,
              )
            ]),
      ),
    );
  }
}

class SalesData {
  SalesData(this.sales, this.year);
  final String year;
  final int sales;
}
