import 'package:expense_tracker/model/expense_model.dart';
import 'package:expense_tracker/providers/expense_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _dateController = TextEditingController();
  DateTime? _selectedDate;
  Category? _selectedCategory;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final keyboardSpace = mediaQuery.viewInsets.bottom;

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10, 10, 10, keyboardSpace + 15),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextField(
              controller: _titleController,
              maxLength: 20,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _amountController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Amount',
                prefixText: '₹ ',
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: _displayDatePicker,
              child: AbsorbPointer(
                child: TextFormField(
                  controller: _dateController,
                  decoration: const InputDecoration(
                    labelText: 'Date',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            DropdownButtonFormField(
              initialValue: _selectedCategory,
              decoration: const InputDecoration(
                labelText: 'Category',
              ),
              icon: const Icon(Icons.arrow_drop_down),
              items: Category.values
                  .map(
                    (category) => DropdownMenuItem(
                      value: category,
                      child: Text(category.name[0].toUpperCase() +
                          category.name.substring(1)),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value == null) {
                  return;
                } else {
                  setState(() {
                    _selectedCategory = value;
                  });
                }
              },
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel', style: GoogleFonts.lato(fontSize: 19)),
                ),
                const SizedBox(width: 38),
                ElevatedButton(
                    onPressed: _saveExpense,
                    child: Text(
                      'Save',
                      style: GoogleFonts.lato(fontSize: 19),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  void _saveExpense() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    final expenseProvider =
        Provider.of<ExpenseProvider>(context, listen: false);

    if (_titleController.text.trim().isEmpty) {
      _showErrorMessage('Please enter a title');
    }
    if (amountIsInvalid) {
      _showErrorMessage('Please enter a valid amount');
    }
    if (_selectedDate == null) {
      _showErrorMessage('Please enter a date');
    }
    if (_selectedCategory == null) {
      _showErrorMessage('Please select a category');
    }

    final newExpense = ExpenseModel(_titleController.text, enteredAmount!,
        _selectedDate!, _selectedCategory!);

    expenseProvider.addExpense(newExpense);
    Navigator.pop(context);
  }

  void _showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Invalid Input'),
              content: Text(message),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Ok'))
              ],
            ));
  }

  Future<void> _displayDatePicker() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year, 1),
      lastDate: now,
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text = formatter.format(pickedDate);
      });
    }
  }
}
