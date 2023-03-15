import 'package:flutter/material.dart';
import 'package:spendee/data/utility.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Chart extends StatefulWidget {
  int indexx;
  Chart({super.key, required this.indexx});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final int sales;
}
