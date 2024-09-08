
import 'package:expenses_tracker/Module/Expenses/Widgets/Lists/ExpensesList/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expenses_tracker/Module/Expenses/Models/expense_model.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

    final List<ExpenseModel> expenses ;
  @override
    Widget build(BuildContext context) {

    return ListView.builder(itemCount: expenses.length, itemBuilder: (ctx, index) => ExpenseItem(expense: expenses[index]));
  }
}
