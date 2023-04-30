import 'package:expense_app/data/expenses.dart';
import 'package:expense_app/helper_functions.dart';
import 'package:expense_app/models/expenses.dart';
import 'package:expense_app/widgets/add_expense.dart';
import 'package:expense_app/widgets/chart.dart';
import 'package:expense_app/widgets/expense_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DesktopScreen extends StatefulWidget {
  const DesktopScreen({super.key});

  @override
  State<DesktopScreen> createState() => _DesktopScreenState();
}

class _DesktopScreenState extends State<DesktopScreen> {
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
      resizeToAvoidBottomInset: false,
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
              child: Row(
                children: [
                  Expanded(
                    child: Chart(
                      allExpenses: expenses,
                    ),
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
