import 'package:expense_tracker/model/expense_model.dart';
import 'package:expense_tracker/themes/constants.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final ExpenseModel expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: appPrimaryColor.withValues(alpha: 0.5),
              child: Icon(categoryIcons[expense.category]),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      expense.expenseTitle,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        '₹ ${expense.expenseAmount.toStringAsFixed(2)}',
                      ),
                      const Spacer(),
                      Text(
                        expense.formattedDate(),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
