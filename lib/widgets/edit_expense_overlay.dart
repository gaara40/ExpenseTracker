import 'package:expense_tracker/forms/edit_expense.dart';
import 'package:expense_tracker/model/expense_model.dart';
import 'package:expense_tracker/themes/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditExpenseOverlay extends StatelessWidget {
  const EditExpenseOverlay({super.key, required this.expense});

  final ExpenseModel expense;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: overlayBackgroundGradient,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                const SizedBox(height: 60),
                Center(
                  child: Text(
                    'Edit Expense',
                    style: GoogleFonts.robotoSlab(
                        fontWeight: FontWeight.bold,
                        fontSize: 38,
                        color: Colors.white.withValues(alpha: 0.8)),
                  ),
                ),
                const SizedBox(height: 50),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: EditExpense(
                      expense: expense,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
