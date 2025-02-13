import 'category_type.dart';

class CashFlowData {
  DateTime date;
  bool? isIncome;
  int? amount;
  CategoryType category;

  CashFlowData({
    required this.date,
    required this.isIncome,
    required this.amount,
    required this.category,});
}