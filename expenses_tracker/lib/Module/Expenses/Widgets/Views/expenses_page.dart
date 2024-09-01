import 'package:expenses_tracker/Module/Expenses/Enums/category_enum.dart';
import 'package:flutter/material.dart';
import 'package:expenses_tracker/Module/Expenses/Models/ExpenseModel.dart';
import 'package:expenses_tracker/Module/Expenses/Widgets/Lists/ExpensesList/expenses_list.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});

  @override
  State<ExpensesPage> createState() {
    return _ExpensesPage();
  }
}

class _ExpensesPage extends State<ExpensesPage> {
  final List<ExpenseModel> _registeredExpenses = [
    ExpenseModel(title: "Flutter", amount: 19.99, category: CategoryEnum.work),
    ExpenseModel(title: "Cinema", amount: 15.69, category: CategoryEnum.food)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  print("object");
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: Center(
          child: Column(children: [
            Expanded(child: ExpensesList(expenses: _registeredExpenses))
          ]),
        ));
  }
}
