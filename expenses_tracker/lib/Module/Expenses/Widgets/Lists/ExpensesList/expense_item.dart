import 'package:expenses_tracker/Module/Expenses/Enums/category_enum.dart';
import 'package:expenses_tracker/Module/Expenses/Models/expense_model.dart';
import 'package:expenses_tracker/Util/Constants/expenses/expense_item_constants.dart';
import 'package:expenses_tracker/Util/Constants/theme_constants.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget{
const ExpenseItem({super.key, required this.expense});
final ExpenseModel expense;
  @override
  Widget build(BuildContext context) {
    return Card(child: Padding(
      padding: const EdgeInsets.all(ThemeConstants.defaultPaddingCard),
      child: Column(
        children: <Widget>[
          Text(expense.title),
           const SizedBox(height: ThemeConstants.defaultSpacingVertical),
          Row(
            children: [
              Text("\$ ${expense.amount.toString()}"),
             const Spacer(),
               Icon(expense.category.icon()),
              const SizedBox(width: ExpenseItemConstants.paddingBetweenIconDate),
              Text(expense.dateFormatted),
            ],
          ),
        ],
      ),
    ),);
  }
}