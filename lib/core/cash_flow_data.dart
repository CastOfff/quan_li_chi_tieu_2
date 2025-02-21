import 'package:hive_ce/hive.dart';
import 'category_type.dart';
part 'cash_flow_data.g.dart';

@HiveType(typeId: 0)
class CashFlowData extends HiveObject {
  @HiveField(0)
  DateTime date;

  @HiveField(1)
  bool isIncome;

  @HiveField(2)
  int amount;

  @HiveField(3)
  CategoryType category;

  CashFlowData({
    required this.date,
    required this.isIncome,
    required this.amount,
    required this.category,
  });
}