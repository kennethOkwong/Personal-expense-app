import 'package:expense_app/data/expenses.dart';
import 'package:expense_app/helper_functions.dart';
import 'package:expense_app/models/expenses.dart';
import 'package:expense_app/widgets/add_expense.dart';
import 'package:expense_app/widgets/chart.dart';
import 'package:expense_app/widgets/expense_list.dart';
import 'package:flutter/material.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  void _addExpense() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => AddExpensemodalSheet(
        onPressed: (title, amount, date, category) {
          final amountIsValid = double.tryParse(amount);
          if (title.trim().isEmpty || amountIsValid == null) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('An error occured!'),
                  content: const Text('incomplete or invalid inputs'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Okay'),
                    ),
                  ],
                );
              },
            );
            return;
          }
          setState(() {
            expenses.add(
              Expenses(
                title: title,
                amount: amountIsValid,
                date: date,
                category: category,
              ),
            );
          });
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final noExpense = expenses.isEmpty;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense App'),
        actions: [
          IconButton(
            onPressed: () => _addExpense(),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: noExpense
          ? const Center(child: Text('No Expense. Start adding your expenses'))
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Chart(
                    allExpenses: expenses,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ExpensesList(
                    expenses: expenses,
                    onRemove: (expense) => romoveExpense(context, expense),
                  ),
                ],
              ),
            ),
    );
  }
}
