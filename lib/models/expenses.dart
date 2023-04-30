import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

//If you add category, add corresponding icon in the map below
enum Category { food, travel, work, leisure }

Map<Category, IconData> categoryIcon = {
  Category.food: Icons.food_bank_rounded,
  Category.travel: Icons.flight_takeoff,
  Category.work: Icons.work_outline_rounded,
  Category.leisure: Icons.directions_bike_outlined
};

const uuid = Uuid();

//Expenses model class
class Expenses {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expenses({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = 'uuid';
}
