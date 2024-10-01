import 'package:expenses_tracker/Util/Constants/expenses/new_expense_constants.dart';
import 'package:expenses_tracker/Util/Constants/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
final formatter = DateFormat.MMMEd();

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
  DateTime? _selectedDate;

  void _showDate() async {
    final date = DateTime.now();
    final firstDate = DateTime(date.year,date.month -1); 
    final lastDate = DateTime(date.year,date.month +1); 
    final result  = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: lastDate);
      setState(() {
        _selectedDate = result ;
      });
  }

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
            maxLength: NewExpenseConstants.titleTextLength,
            decoration: const InputDecoration(
                label: Text(NewExpenseConstants.titleText)),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountTextController,
                  keyboardType: TextInputType.number,
                  maxLength: NewExpenseConstants.titleTextLength,
                  decoration: const InputDecoration(
                      prefixText: "\$ ",
                      label: Text(NewExpenseConstants.amountText)),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate == null ? NewExpenseConstants.selectDate : formatter.format(_selectedDate!)),
                    IconButton(
                        onPressed: _showDate, icon: const Icon(Icons.date_range))
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    print(_titleTextController.text);
                    print(_amountTextController.text);
                  },
                  child: const Text(NewExpenseConstants.saveButton)),
              const SizedBox(width: ThemeConstants.defaultSpacingHorizontal),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(NewExpenseConstants.cancelButton))
            ],
          )
        ],
      ),
    );
  }
}
