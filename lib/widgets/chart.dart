import 'package:expense_app/models/expenses.dart';
import 'package:flutter/material.dart';

//widget to output the whole chartbar area
class Chart extends StatelessWidget {
  const Chart({super.key, required this.allExpenses});

  final List<Expenses> allExpenses;

  List<Category> get _getListOfCategory {
    final List<Category> listOfCategories = [];
    categoryIcon.entries
        .map((category) => listOfCategories.add(category.key))
        .toList();
    return listOfCategories;
  }

  Map<String, Object> chartBarData(
    List<Expenses> expenses,
    Category category,
  ) {
    //  final listOfCategories = _getListOfCategory;
    var sum = 0.00;
    for (final expense in expenses) {
      if (expense.category == category) {
        sum += expense.amount;
      }
    }
    return {'category': category, 'total_expense': sum};
  }

  List<Map<String, Object>> get chartData {
    return _getListOfCategory
        .map((category) => chartBarData(allExpenses, category))
        .toList();
  }

  double get maxExpense {
    final List<Map<String, Object>> categoryExpense = chartData;
    double maxExpense = 0.00;
    for (final category in categoryExpense) {
      if (maxExpense < (category['total_expense'] as double)) {
        maxExpense = category['total_expense'] as double;
      }
    }

    return maxExpense;
  }

  @override
  Widget build(BuildContext context) {
    maxExpense;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.0)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 180,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ...chartData.map(
                  (cateory) => ChartBar(
                      fill: cateory['total_expense'] == 0.00
                          ? 0
                          : (cateory['total_expense'] as double) / maxExpense),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...categoryIcon.entries.map((category) => Icon(category.value))
            ],
          ),
        ],
      ),
    );
  }
}

//widget to output each chart bar base on provided ratio
class ChartBar extends StatelessWidget {
  const ChartBar({super.key, required this.fill});

  final double fill;
  // final IconData icon;

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: FractionallySizedBox(
            heightFactor: fill,
            alignment: FractionalOffset.bottomCenter,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: isDarkMode
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primary.withOpacity(0.7),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
