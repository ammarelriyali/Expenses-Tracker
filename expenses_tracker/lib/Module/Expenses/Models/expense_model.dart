import 'package:uuid/uuid.dart';
import 'package:expenses_tracker/Module/Expenses/Enums/category_enum.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

class ExpenseModel {
  ExpenseModel(
      {required this.title, required this.amount, required this.category, required this.date})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final CategoryEnum category;

  String get dateFormatted {
    return formatter.format(date);
  }
}
