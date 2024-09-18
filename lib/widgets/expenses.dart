import 'package:flutter/material.dart';
import 'package:flutter_application_003/widgets/chart/chart.dart';
import 'package:flutter_application_003/widgets/expenses_list/expenses_list.dart';
import 'package:flutter_application_003/widgets/new_expese.dart';
import '../model/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerExpenses = [
    // Expense(
    //   title: 'New Shoes',
    //   amount: 69.99,
    //   date: DateTime.now(),
    //   category: Category.leisure,
    // ),
    // Expense(
    //   title: 'Weekly Groceries',
    //   amount: 16.53,
    //   date: DateTime.now(),
    //   category: Category.food,
    // ),
  ];

  void _openAddExpense() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpese(
              onAddExpense: _addExpense,
            ));
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registerExpenses.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    final expenseIndex = _registerExpenses.indexOf(expense);
    setState(() {
      _registerExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registerExpenses.insert(expenseIndex, expense);
              });
            }),
        content: const Text('Expense removed'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses added yet,Start adding some!'),
    );

    if (_registerExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registerExpenses,
        onRemoveExpense: removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: _openAddExpense, icon: const Icon(Icons.add))
        ],
        title: const Text('Expense Tracker'),
      ),
      body: Column(
        children: [
          Chart(expenses: _registerExpenses) ,
          Expanded(
            child: mainContent,
          )
        ],
      ),
    );
  }
}
