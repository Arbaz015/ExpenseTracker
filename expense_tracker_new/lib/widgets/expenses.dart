import 'package:expense_tracker_new/widgets/chart/chart.dart';
import 'package:expense_tracker_new/widgets/expenses_list/expense_list.dart';
import 'package:expense_tracker_new/models/expense.dart';
import 'package:expense_tracker_new/widgets/new_expens.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpense = [
    Expense(
        title: 'Flutter Course',
        amount: 19.88,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Cinema ',
        amount: 100.88,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpens(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpense.add(expense);
    });
  }

  void _removeExpens(Expense expense) {
    final expensIndex = _registeredExpense.indexOf(expense);

    setState(() {
      _registeredExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 3),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registeredExpense.insert(expensIndex, expense);
              });
            }),
        content: Text('Expense Deleted')));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Text('No Expense found. Start Adding Some'),
    );

    if (_registeredExpense.isNotEmpty) {
      mainContent = ExpenseList(
          expenses: _registeredExpense, onRemoveExpense: _removeExpens);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: Icon(Icons.add),
            color: Colors.white,
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registeredExpense),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
