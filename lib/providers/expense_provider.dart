import 'package:expense_tracker/model/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

enum SortType { newestFirst, oldestFirst, highestAmount, lowestAmount }

class ExpenseProvider extends ChangeNotifier {
  List<ExpenseModel> _registeredExpenses = [];
  ExpenseModel? _deletedExpense;
  int? keyToDelete;

  List<ExpenseModel> get registeredExpenses => _registeredExpenses;

  final Box<ExpenseModel> _expenseBox = Hive.box<ExpenseModel>('expenseBox');

  Box<ExpenseModel> get expenseBox => _expenseBox;

  SortType _currentSort = SortType.newestFirst;

  SortType get currentSort => _currentSort;

  ExpenseProvider() {
    loadExpenses();
  }

  void loadExpenses() {
    _registeredExpenses = _expenseBox.values.toList();
    _sortExpenses();
    notifyListeners();
  }

  Future<void> addExpense(ExpenseModel expense) async {
    await _expenseBox.add(expense);
    _registeredExpenses = _expenseBox.values.toList();
    _sortExpenses();
    notifyListeners();
  }

  Future<void> deleteExpense(ExpenseModel expense) async {
    _deletedExpense = expense;
    keyToDelete = expense.key as int;
    await _expenseBox.delete(keyToDelete);
    _registeredExpenses = _expenseBox.values.toList();
    _sortExpenses();
    notifyListeners();
  }

  Future<void> undoDeleteExpense(ExpenseModel expense) async {
    if (_deletedExpense != null && keyToDelete != null) {
      _expenseBox.put(keyToDelete, _deletedExpense!);
      _registeredExpenses = _expenseBox.values.toList();
      _sortExpenses();
      _deletedExpense = null;
      keyToDelete = null;
      notifyListeners();
    }
  }

  Future<void> editExpense(ExpenseModel updatedExpense, int key) async {
    _expenseBox.put(key, updatedExpense);
    _registeredExpenses = _expenseBox.values.toList();
    _sortExpenses();
    notifyListeners();
  }

  void setSortType(SortType sortType) {
    _currentSort = sortType;
    _sortExpenses();
    notifyListeners();
  }

  void _sortExpenses() {
    switch (_currentSort) {
      case SortType.newestFirst:
        _registeredExpenses
            .sort((a, b) => b.expenseDateTime.compareTo(a.expenseDateTime));
        break;
      case SortType.oldestFirst:
        _registeredExpenses
            .sort((a, b) => a.expenseDateTime.compareTo(b.expenseDateTime));
        break;
      case SortType.highestAmount:
        _registeredExpenses
            .sort((a, b) => b.expenseAmount.compareTo(a.expenseAmount));
        break;
      case SortType.lowestAmount:
        _registeredExpenses
            .sort((a, b) => a.expenseAmount.compareTo(b.expenseAmount));
        break;
    }
  }
}
