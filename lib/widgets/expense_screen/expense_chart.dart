import 'package:expenseapp/models/database_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ExpenseChart extends StatefulWidget {
  final String category;
  ExpenseChart({super.key, required this.category});

  @override
  State<ExpenseChart> createState() => _ExpenseChartState();
}

class _ExpenseChartState extends State<ExpenseChart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(builder: (_, db, __) {
      var maxY = db.calculateEntriesAndAmount(widget.category)['totalAmount'];
      var list = db.calculateWeekExpenses().reversed.toList();
      return BarChart(
        BarChartData(
            minY: 0,
            maxY: maxY,
            barGroups: [
              ...list
                  .map((e) => BarChartGroupData(x: list.indexOf(e), barRods: [
                        BarChartRodData(
                          toY: e['amount'],
                          width: 20.0,
                          borderRadius: BorderRadius.zero,
                        ),
                      ]))
            ],
            titlesData: FlTitlesData(
                topTitles: AxisTitles(
                    drawBelowEverything: true), //drawBehindEverything ??? error
                leftTitles: AxisTitles(drawBelowEverything: true),
                rightTitles: AxisTitles(drawBelowEverything: true),
                bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, _) =>
                      Text(DateFormat.E().format(list[value.toInt()]['day'])),
                )))),
      );
    });
  }
}
