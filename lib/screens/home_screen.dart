import 'package:expense_tracker/model/expense_model.dart';
import 'package:expense_tracker/providers/expense_provider.dart';
import 'package:expense_tracker/widgets/add_expense_overlay.dart';
import 'package:expense_tracker/widgets/chart.dart';
import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 249, 255),
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          Consumer<ExpenseProvider>(
            builder: (context, provider, _) {
              return PopupMenuButton<SortType>(
                icon: const Icon(Icons.swap_vert),
                onSelected: (SortType selectedSort) {
                  provider.setSortType(selectedSort);
                },
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<SortType>>[
                  const PopupMenuItem<SortType>(
                    value: SortType.newestFirst,
                    child: ListTile(
                      leading: Icon(Icons.schedule),
                      title: Text('Newest First'),
                    ),
                  ),
                  const PopupMenuItem<SortType>(
                    value: SortType.oldestFirst,
                    child: ListTile(
                      leading: Icon(Icons.history),
                      title: Text('Oldest First'),
                    ),
                  ),
                  const PopupMenuItem<SortType>(
                    value: SortType.highestAmount,
                    child: ListTile(
                      leading: Icon(Icons.trending_up),
                      title: Text('Highest Amount'),
                    ),
                  ),
                  const PopupMenuItem<SortType>(
                    value: SortType.lowestAmount,
                    child: ListTile(
                      leading: Icon(Icons.trending_down),
                      title: Text('Lowest Amount'),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExpenseProvider>(
            builder: (context, value, child) =>
                Chart(expenses: value.registeredExpenses),
          ),
          const SizedBox(height: 10),
          Consumer<ExpenseProvider>(builder: (context, value, child) {
            final registeredExpenses = value.registeredExpenses;
            return Expanded(
                child: registeredExpenses.isEmpty
                    ? const Center(
                        child: Text(
                          'No expenses added\n Click + to add',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      )
                    : ExpensesList(
                        expenses: registeredExpenses,
                        onDeletedExpense: _removeExpense,
                      ));
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddExpenseOverlay,
        backgroundColor: const Color.fromARGB(255, 107, 155, 239),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddExpenseOverlay() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: false,
        builder: (context) => const AddExpenseOverlay());
  }

  void _removeExpense(ExpenseModel expense) {
    final expenseProvider =
        Provider.of<ExpenseProvider>(context, listen: false);
    expenseProvider.deleteExpense(expense);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: const Text('Expense has been deleted'),
          duration: const Duration(seconds: 2),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () => expenseProvider.undoDeleteExpense(expense),
          )),
    );
  }
}
