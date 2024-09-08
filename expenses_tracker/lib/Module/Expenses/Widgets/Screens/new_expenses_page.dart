import 'package:expenses_tracker/Util/Constants/expenses/new_expense_constants.dart';
import 'package:expenses_tracker/Util/Constants/theme_constants.dart';
import 'package:flutter/material.dart';

class NewExpensesPage extends StatefulWidget {
  const NewExpensesPage({super.key});

  @override
  State<NewExpensesPage> createState() {
    return _NewExpensesPage();
  }
}

class _NewExpensesPage extends State<NewExpensesPage> {
  final _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(ThemeConstants.defaultPadding),
      child: Column(
        children: [
          TextField(controller: _textEditingController,
            maxLength: NewExpenseConstants.expenseNameTextLength,
            decoration: const InputDecoration(
                label: Text(NewExpenseConstants.expenseNameText)),
          ),
          Row(
            children: [ElevatedButton(onPressed: (){print(_textEditingController.text);}, child: const Text(NewExpenseConstants.expenseNameSaveButton))],
          )
        ],
      ),
    );
  }
}
