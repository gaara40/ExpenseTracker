import 'package:expense_tracker/forms/new_expense.dart';
import 'package:expense_tracker/themes/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: blueGradient,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                const SizedBox(height: 60),
                Center(
                  child: Text(
                    'Add Expense',
                    style: GoogleFonts.robotoSlab(
                        fontWeight: FontWeight.bold,
                        fontSize: 38,
                        color: Colors.white.withValues(alpha: 0.7)),
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
                    child: const NewExpense(),
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
