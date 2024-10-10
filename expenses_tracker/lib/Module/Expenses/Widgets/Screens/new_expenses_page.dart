import 'package:expenses_tracker/Module/Expenses/Enums/category_enum.dart';
import 'package:expenses_tracker/Module/Expenses/Models/expense_model.dart';
import 'package:expenses_tracker/Util/Constants/expenses/new_expense_constants.dart';
import 'package:expenses_tracker/Util/Constants/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.MMMEd();

class NewExpensesPage extends StatefulWidget {
  const NewExpensesPage({super.key, required this.onAddExpense });
  final void Function(ExpenseModel) onAddExpense;
  @override
  State<NewExpensesPage> createState() {
    return _NewExpensesPage();
  }
}

class _NewExpensesPage extends State<NewExpensesPage> {
  final _titleTextController = TextEditingController();
  final _amountTextController = TextEditingController();
  CategoryEnum _selectedDropDown = CategoryEnum.food;
  DateTime? _selectedDate;

  void _submitExpensesData() {
    final amount = double.tryParse(_amountTextController.text);
    final isNotValidAmount = amount == null || amount <= 0;
    if (isNotValidAmount ||
        _titleTextController.text.trim().isEmpty ||
        _selectedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text(NewExpenseConstants.alertErrorTitle),
                content: const Text(NewExpenseConstants.alertErrorMassage),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(ctx), child: Text(NewExpenseConstants.alertErrorButtonText))
                ],
              ));
      return;
    } else {
        widget.onAddExpense(ExpenseModel(title: _titleTextController.text, amount: amount, category: _selectedDropDown, date: _selectedDate!));
    }
  }

  void _showDate() async {
    final date = DateTime.now();
    final firstDate = DateTime(date.year, date.month - 1);
    final lastDate = DateTime(date.year, date.month + 1);
    final result = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: lastDate);
    setState(() {
      _selectedDate = result;
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
                    Text(_selectedDate == null
                        ? NewExpenseConstants.selectDate
                        : formatter.format(_selectedDate!)),
                    IconButton(
                        onPressed: _showDate,
                        icon: const Icon(Icons.date_range))
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: ThemeConstants.defaultSpacingVertical),
          Row(
            children: [
              DropdownButton(
                  items: CategoryEnum.values
                      .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toUpperCase())))
                      .toList(),
                  value: _selectedDropDown,
                  onChanged: (value) => setState(() {
                        if (value == null) {
                          return;
                        }
                        _selectedDropDown = value;
                      })),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(NewExpenseConstants.cancelButton)),
              const SizedBox(width: ThemeConstants.defaultSpacingHorizontal),
              ElevatedButton(
                  onPressed: _submitExpensesData,
                  child: const Text(NewExpenseConstants.saveButton)),
            ],
          )
        ],
      ),
    );
  }
}
