import 'package:expenses_tracker/Module/Expenses/Widgets/Lists/ExpensesList/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expenses_tracker/Module/Expenses/Models/expense_model.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses, required this.onRemoveExpense});

  final List<ExpenseModel> expenses;
  final void Function(String id) onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(
            key: ValueKey(expenses[index].id),
            onDismissed: (direction) {
              onRemoveExpense(expenses[index].id);
            },
            child: ExpenseItem(expense: expenses[index])));
  }
}
