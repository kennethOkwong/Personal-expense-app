import 'package:expense_app/data/expenses.dart';
import 'package:expense_app/models/expenses.dart';
import 'package:flutter/material.dart';

romoveExpense(BuildContext context, Expenses expense) {
  expenses.remove(expense);
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('You deleted an item'),
    ),
  );
}
