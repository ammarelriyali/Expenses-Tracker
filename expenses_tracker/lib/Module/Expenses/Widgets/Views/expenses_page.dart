import 'package:expenses_tracker/Util/Constants/expenses/expenses_constants.dart';
import 'package:flutter/material.dart';
import 'package:expenses_tracker/Module/Expenses/Widgets/Lists/ExpensesList/expenses_list.dart';
import 'package:expenses_tracker/Module/Expenses/Models/mock_expense_model.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});

  @override
  State<ExpensesPage> createState() {
    return _ExpensesPage();
  }
}

class _ExpensesPage extends State<ExpensesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  print("test");
                },
                icon: const Icon(ExpensesConstants.appBarIcon))
          ],
        ),
        body: Center(
          child: Column(children: [
            Expanded(child: ExpensesList(expenses: registeredExpenses))
          ]),
        ));
  }
}
