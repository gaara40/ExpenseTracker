import 'package:expense_tracker/model/expense_model.dart';
import 'package:expense_tracker/widgets/edit_expense_overlay.dart';
import 'package:expense_tracker/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onDeletedExpense});

  final List<ExpenseModel> expenses;
  final void Function(ExpenseModel expense) onDeletedExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: ValueKey(expenses[index]),
          direction: DismissDirection.horizontal,
          background: Container(
            color: Colors.red.withValues(alpha: 0.6),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerLeft,
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          secondaryBackground: Container(
            color: Colors.green.withValues(alpha: 0.6),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerRight,
            child: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
          confirmDismiss: (direction) async {
            if (direction == DismissDirection.startToEnd) {
              onDeletedExpense(expenses[index]);
              return true;
            } else if (direction == DismissDirection.endToStart) {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  isDismissible: false,
                  builder: (context) =>
                      EditExpenseOverlay(expense: expenses[index]));
              return false;
            }
            return false;
          },
          child: ExpenseItem(expense: expenses[index]),
        );
      },
    );
  }
}
