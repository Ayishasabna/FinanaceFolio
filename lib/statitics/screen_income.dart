import 'package:flutter/material.dart';
import 'package:spendee/data/utility.dart';
import 'package:spendee/db/transaction_db.dart';
import 'package:spendee/models/transactions/transaction_model.dart';
import 'package:spendee/statitics/statitics_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ScreenIncomeChart extends StatelessWidget {
  ScreenIncomeChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 246, 245, 245),
        body: ValueListenableBuilder(
          valueListenable: overViewGraphNotifier,
          builder: (BuildContext context, List<TransactionModel> newList,
              Widget? child) {
            var allIncome = newList
                .where((element) => element.finanace == 'income')
                .toList();
            return overViewGraphNotifier.value.isEmpty
                ? SingleChildScrollView(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Center(child: Text('No data Found')),
                        ],
                      ),
                    ),
                  )
                : SfCircularChart(
                    series: <CircularSeries>[
                      PieSeries<TransactionModel, String>(
                        dataSource: allIncome,
                        xValueMapper: (TransactionModel incomeDate, _) =>
                            incomeDate.category.categoryName,
                        yValueMapper: (TransactionModel incomeDate, _) =>
                            num.parse(incomeDate.amount),
                        //incomeDate.hashCode,
                        dataLabelSettings: const DataLabelSettings(
                          isVisible: true,
                        ),
                      )
                    ],
                    legend: Legend(
                      isVisible: true,
                      overflowMode: LegendItemOverflowMode.scroll,
                      alignment: ChartAlignment.center,
                    ),
                  );
          },
        ),
      ),
    );
  }
}
