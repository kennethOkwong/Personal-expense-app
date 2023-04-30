import 'package:expense_app/models/expenses.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//widget to output List of expenses
class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemove,
  });

  // Map<Category, IconData> get getCategoryIcon {
  //   return {
  //     Category.food: Icons.food_bank_rounded,
  //     Category.travel: Icons.flight_takeoff,
  //     Category.work: Icons.work,
  //     Category.leisure: Icons.directions_bike
  //   };
  // }

  final List<Expenses> expenses;
  final Function(Expenses expense) onRemove;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          return Dismissible(
            background: Container(
              color: Theme.of(context).colorScheme.error,
            ),
            onDismissed: (direction) {
              onRemove(expenses[index]);
            },
            key: ValueKey(expenses[index]),
            child: ExpenseCard(
              title: expenses[index].title,
              amount: expenses[index].amount,
              icon: categoryIcon[expenses[index].category]!,
              date: expenses[index].date,
            ),
          );
        },
      ),
    );
  }
}

//Widget to buid a single expense item
class ExpenseCard extends StatelessWidget {
  const ExpenseCard({
    super.key,
    required this.title,
    required this.amount,
    required this.icon,
    required this.date,
  });

  final String title;
  final double amount;
  final IconData icon;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Card(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text('NGN${amount.toStringAsFixed(2)}'),
                  const Spacer(),
                  Icon(
                    icon,
                    size: 20,
                    color: Colors.grey.shade600,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(DateFormat.yMd().format(date))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
