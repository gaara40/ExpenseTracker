import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

part 'expense_model.g.dart';

const uuid = Uuid();

final formatter = DateFormat('d MMM y');

@HiveType(typeId: 0)
enum Category {
  @HiveField(0)
  essentials,
  @HiveField(1)
  work,
  @HiveField(2)
  travel,
  @HiveField(3)
  leisure
}

const categoryIcons = {
  Category.essentials: Icons.shopping_cart,
  Category.work: Icons.work,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie
};

@HiveType(typeId: 1)
class ExpenseModel extends HiveObject {
  ExpenseModel(this.expenseTitle, this.expenseAmount, this.expenseDateTime,
      this.category)
      : expenseId = uuid.v4();

  @HiveField(0)
  final String expenseId;

  @HiveField(1)
  final String expenseTitle;

  @HiveField(2)
  final double expenseAmount;

  @HiveField(3)
  final DateTime expenseDateTime;

  @HiveField(4)
  final Category category;

  String formattedDate() {
    return formatter.format(expenseDateTime);
  }
}

class ExpenseBucket {
  final List<ExpenseModel> expenses;
  final Category category;

  ExpenseBucket.forCategory(List<ExpenseModel> allExpenses, this.category)
      : expenses = allExpenses
            .where(
              (element) => element.category == category,
            )
            .toList();

  double get totalExpense {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.expenseAmount;
    }
    return sum;
  }
}
