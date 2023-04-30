import 'package:expense_app/models/expenses.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//Widget to Output modal bottom sheet for adding expense
class AddExpensemodalSheet extends StatefulWidget {
  const AddExpensemodalSheet({super.key, required this.onPressed});

  final void Function(
      String title, String amount, DateTime date, Category category) onPressed;

  @override
  State<AddExpensemodalSheet> createState() => _AddExpensemodalSheetState();
}

class _AddExpensemodalSheetState extends State<AddExpensemodalSheet> {
  DateTime date = DateTime.now();
  pickDate() async {
    final DateTime initialDate = DateTime.now();
    final DateTime firstDate =
        DateTime.now().subtract(const Duration(days: 365));
    final DateTime lastDate = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    setState(() {
      date = pickedDate ?? date;
    });
  }

  final titleFieldController = TextEditingController();
  final amountFieldController = TextEditingController();
  Category selectedCategory = Category.leisure;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        if (constraint.maxWidth < 600) {
          return SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  children: [
                    TextField(
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('Enter Title'),
                      ),
                      controller: titleFieldController,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              label: Text('Enter Amount'),
                              prefixText: '\$',
                            ),
                            controller: amountFieldController,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Text(DateFormat.yMd().format(date)),
                        IconButton(
                          onPressed: () {
                            pickDate();
                          },
                          icon: const Icon(
                            Icons.edit,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        DropdownButton(
                          value: selectedCategory,
                          items: [
                            ...Category.values.map(
                              (value) => DropdownMenuItem(
                                value: value,
                                child: Text(value.name.toUpperCase()),
                              ),
                            )
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedCategory = value ?? selectedCategory;
                            });
                          },
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            widget.onPressed(
                                titleFieldController.text,
                                amountFieldController.text,
                                date,
                                selectedCategory);
                          },
                          child: const Text('Add Expense'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextField(
                            maxLength: 50,
                            decoration: const InputDecoration(
                              label: Text('Enter Title'),
                            ),
                            controller: titleFieldController,
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                                label: Text('Enter Amount'),
                                prefixText: '\$',
                                prefixStyle: TextStyle(fontSize: 10)),
                            controller: amountFieldController,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        DropdownButton(
                          value: selectedCategory,
                          items: [
                            ...Category.values.map(
                              (value) => DropdownMenuItem(
                                value: value,
                                child: Text(value.name.toUpperCase()),
                              ),
                            )
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedCategory = value ?? selectedCategory;
                            });
                          },
                        ),
                        const Spacer(),
                        Text(DateFormat.yMd().format(date)),
                        IconButton(
                          onPressed: () {
                            pickDate();
                          },
                          icon: const Icon(
                            Icons.edit,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            widget.onPressed(
                                titleFieldController.text,
                                amountFieldController.text,
                                date,
                                selectedCategory);
                          },
                          child: const Text('Add Expense'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
