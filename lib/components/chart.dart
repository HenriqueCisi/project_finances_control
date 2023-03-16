import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_finances_control/components/chart_bar.dart';
import 'package:project_finances_control/models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart(this.recentTransactions, {super.key});

  List<Map<String, Object>> get mostRecentTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalAmount = 0.0;

      for(var i = 0; i < recentTransactions.length; i++){
        bool sameDay = recentTransactions[i].date.day == weekDay.day;
        bool sameMonth = recentTransactions[i].date.month == weekDay.month;
        bool sameYear = recentTransactions[i].date.year == weekDay.year;


        if(sameDay && sameMonth && sameYear){
          totalAmount += recentTransactions[i].value;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalAmount,
      };
    });
  }

  double get _weekTotalValue {
    return mostRecentTransactions.fold(0.0, (sum, tr) {
    return sum + (tr['value'] as double );
    });
  }

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: mostRecentTransactions.map((transaction) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  label: transaction['day'].toString(),
                  value: double.parse(transaction['value'].toString()),
                  percentage: ((transaction['value'] as double ) / _weekTotalValue)
                  ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
