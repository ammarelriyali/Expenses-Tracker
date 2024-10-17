import 'package:expenses_tracker/Module/Expenses/Enums/category_enum.dart';
import 'package:expenses_tracker/Module/Expenses/Models/expense_model.dart';
import 'package:expenses_tracker/Module/Expenses/Widgets/Screens/new_expenses_page.dart';
import 'package:expenses_tracker/Util/Constants/expenses/expenses_constants.dart';
import 'package:flutter/material.dart';
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
    ExpenseModel(
        title: "Flutter",
        amount: 19.99,
        category: CategoryEnum.work,
        date: DateTime.now()),
    ExpenseModel(
        title: "Cinema",
        amount: 15.69,
        category: CategoryEnum.food,
        date: DateTime.now())
  ];

  void _addNewExpenses(ExpenseModel expenseModel) {
    setState(() {
      _registeredExpenses.add(expenseModel);
    });
  }
    void _removeExpense(String id) {
      _registeredExpenses.removeWhere((expense)=> expense.id == id);
    }

  void _buildBottom() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (ctx) {
          return NewExpensesPage(onAddExpense: _addNewExpenses);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(ExpensesConstants.title),
          actions: [
            IconButton(
                onPressed: _buildBottom,
                icon: const Icon(ExpensesConstants.appBarIcon))
          ],
        ),
        body: Center(
          child: Column(children: [
            Expanded(child: ExpensesList(expenses: _registeredExpenses, onRemoveExpense: _removeExpense))
          ]),
        ));
  }
}
