import 'package:uuid/uuid.dart';
import 'package:expenses_tracker/Module/Expenses/Enums/category_enum.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formatter = DateFormat.Hms();

class ExpenseModel {
  ExpenseModel(
      {required this.title, required this.amount, required this.category})
      : id = uuid.v4(),
        _data = DateTime.now();

  final String id;
  final String title;
  final double amount;
  final DateTime _data;
  final CategoryEnum category;

  String get date {
    return formatter.format(_data);
  }
}
