import 'package:expenses_tracker/Module/Expenses/Enums/category_enum.dart';
import 'package:expenses_tracker/Module/Expenses/Models/ExpenseModel.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget{
const ExpenseItem({super.key, required this.expense});
final ExpenseModel expense;
  @override
  Widget build(BuildContext context) {
    return Card(child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          Text(expense.title),
           const SizedBox(height: 12),
          Row(
            children: [
              Text("\$ ${expense.amount.toString()}"),
             const Spacer(),
               Icon(expense.category.icon()),
              const SizedBox(width: 8),
              Text(expense.date),
            ],
          ),
        ],
      ),
    ),);
  }
}