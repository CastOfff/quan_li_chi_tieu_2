import '../core/cash_flow_data.dart';
import '../core/category_type.dart';
import '../providers/data_provider.dart';

ListData data = ListData(data: [
  CashFlowData(date: DateTime(2025, 2, 2), isIncome: false, amount: 250000, category: CategoryType.eating),
  CashFlowData(date: DateTime(2025, 2, 2), isIncome: false, amount: 500000, category: CategoryType.cosmetics),
  CashFlowData(date: DateTime(2025, 2, 2), isIncome: false, amount: 400000, category: CategoryType.healthcare),
  CashFlowData(date: DateTime(2025, 2, 3), isIncome: false, amount: 450000, category: CategoryType.utilities),
  CashFlowData(date: DateTime(2025, 2, 4), isIncome: false, amount: 280000, category: CategoryType.internet),
  CashFlowData(date: DateTime(2025, 2, 4), isIncome: false, amount: 260000, category: CategoryType.clothes),
  CashFlowData(date: DateTime(2025, 2, 5), isIncome: false, amount: 370000, category: CategoryType.cosmetics),
  CashFlowData(date: DateTime(2025, 2, 6), isIncome: false, amount: 290000, category: CategoryType.healthcare),
  CashFlowData(date: DateTime(2025, 2, 6), isIncome: false, amount: 240000, category: CategoryType.utilities),
  CashFlowData(date: DateTime(2025, 2, 7), isIncome: false, amount: 270000, category: CategoryType.internet),
  CashFlowData(date: DateTime(2025, 2, 8), isIncome: false, amount: 320000, category: CategoryType.clothes),
  CashFlowData(date: DateTime(2025, 2, 8), isIncome: false, amount: 410000, category: CategoryType.cosmetics),
  CashFlowData(date: DateTime(2025, 2, 9), isIncome: false, amount: 260000, category: CategoryType.healthcare),
  CashFlowData(date: DateTime(2025, 2, 10), isIncome: false, amount: 400000, category: CategoryType.utilities),
  CashFlowData(date: DateTime(2025, 2, 10), isIncome: false, amount: 310000, category: CategoryType.internet),

  CashFlowData(date: DateTime(2025, 2, 2), isIncome: true, amount: 150000, category: CategoryType.salary),
  CashFlowData(date: DateTime(2025, 2, 2), isIncome: true, amount: 200000, category: CategoryType.allowance),
  CashFlowData(date: DateTime(2025, 2, 3), isIncome: true, amount: 300000, category: CategoryType.bonus),
  CashFlowData(date: DateTime(2025, 2, 3), isIncome: true, amount: 220000, category: CategoryType.investment),
  CashFlowData(date: DateTime(2025, 2, 4), isIncome: true, amount: 310000, category: CategoryType.sideIncome),
  CashFlowData(date: DateTime(2025, 2, 5), isIncome: true, amount: 340000, category: CategoryType.temporaryIncome),
  CashFlowData(date: DateTime(2025, 2, 5), isIncome: true, amount: 330000, category: CategoryType.salary),
  CashFlowData(date: DateTime(2025, 2, 6), isIncome: true, amount: 360000, category: CategoryType.allowance),
  CashFlowData(date: DateTime(2025, 2, 7), isIncome: true, amount: 310000, category: CategoryType.bonus),
  CashFlowData(date: DateTime(2025, 2, 7), isIncome: true, amount: 350000, category: CategoryType.investment),
  CashFlowData(date: DateTime(2025, 2, 8), isIncome: true, amount: 280000, category: CategoryType.sideIncome),
  CashFlowData(date: DateTime(2025, 2, 9), isIncome: true, amount: 300000, category: CategoryType.temporaryIncome),
  CashFlowData(date: DateTime(2025, 2, 9), isIncome: true, amount: 390000, category: CategoryType.salary),
  CashFlowData(date: DateTime(2025, 2, 10), isIncome: true, amount: 350000, category: CategoryType.allowance),
]);