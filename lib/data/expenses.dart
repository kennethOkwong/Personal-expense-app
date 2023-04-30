import 'package:expense_app/models/expenses.dart';

//Sample expenses data for testing
final List<Expenses> expenses = [
  Expenses(
    amount: 12.99,
    title: 'Bought Pizza',
    date: DateTime.now(),
    category: Category.food,
  ),
  Expenses(
    amount: 123.99,
    title: 'Went to AKS',
    date: DateTime.now(),
    category: Category.travel,
  ),
  // Expenses(
  //   amount: 56.69,
  //   title: 'Bolt to Office',
  //   date: DateTime.now(),
  //   category: Category.work,
  // ),
  // Expenses(
  //   amount: 12.99,
  //   title: 'Bought Pizza',
  //   date: DateTime.now(),
  //   category: Category.food,
  // ),
  // Expenses(
  //   amount: 123.99,
  //   title: 'Went to AKS',
  //   date: DateTime.now(),
  //   category: Category.travel,
  // ),
  // Expenses(
  //   amount: 56.69,
  //   title: 'Bolt to Office',
  //   date: DateTime.now(),
  //   category: Category.work,
  // ),
];
