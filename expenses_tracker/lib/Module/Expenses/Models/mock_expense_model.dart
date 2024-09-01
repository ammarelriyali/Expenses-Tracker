import 'package:expenses_tracker/Module/Expenses/Models/expense_model.dart';
import 'package:expenses_tracker/Module/Expenses/Enums/category_enum.dart';

final List<ExpenseModel> registeredExpenses = [
    ExpenseModel(title: "Flutter", amount: 19.99, category: CategoryEnum.work),
    ExpenseModel(title: "Cinema", amount: 15.69, category: CategoryEnum.food)
  ];