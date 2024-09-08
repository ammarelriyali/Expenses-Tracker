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
  final _titleTextController = TextEditingController();
  final _amountTextController = TextEditingController();

  @override
  void dispose() {
    _titleTextController.dispose();
    _amountTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(ThemeConstants.defaultPadding),
      child: Column(
        children: [
          TextField(
            controller: _titleTextController,
            maxLength: NewExpenseConstants.expenseTitleTextLength,
            decoration: const InputDecoration(
                label: Text(NewExpenseConstants.expenseTitleText)),
          ),
          TextField(
            controller: _amountTextController,
            keyboardType: TextInputType.number,
            maxLength: NewExpenseConstants.expenseTitleTextLength,
            decoration: const InputDecoration( prefixText: "\$ ",
                label: Text(NewExpenseConstants.expenseAmountText)),
          ),
          Row(
            children: [
              
              ElevatedButton(
                  onPressed: () {
                    print(_titleTextController.text);
                    print(_amountTextController.text);
                  },
                  child: const Text(NewExpenseConstants.expenseSaveButton)),
                  const SizedBox(width: ThemeConstants.defaultSpacingHorizontal),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child:
                      const Text(NewExpenseConstants.expenseCancelButton))
            ],
          )
        ],
      ),
    );
  }
}
