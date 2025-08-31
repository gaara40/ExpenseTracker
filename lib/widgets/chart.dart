import 'package:expense_tracker/model/expense_model.dart';
import 'package:expense_tracker/themes/constants.dart';
import 'package:expense_tracker/widgets/chart_bar.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<ExpenseModel> expenses;

  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(expenses, Category.essentials),
      ExpenseBucket.forCategory(expenses, Category.work),
      ExpenseBucket.forCategory(expenses, Category.travel),
      ExpenseBucket.forCategory(expenses, Category.leisure),
    ];
  }

  double get maxTotalExpenses {
    double maxTotalExpense = 0;

    for (final bucket in buckets) {
      if (bucket.totalExpense > maxTotalExpense) {
        maxTotalExpense = bucket.totalExpense;
      }
    }

    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: chartBackgroundGradient),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in buckets)
                  ChartBar(
                    fill: bucket.totalExpense == 0
                        ? 0
                        : bucket.totalExpense / maxTotalExpenses,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: buckets
                .map((bucket) => Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(
                        categoryIcons[bucket.category],
                        color: appPrimaryColor,
                      ),
                    )))
                .toList(),
          )
        ],
      ),
    );
  }
}
