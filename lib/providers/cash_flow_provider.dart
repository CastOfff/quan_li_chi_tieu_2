import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import '../core/cash_flow_data.dart';
import '../core/category_type.dart';

class CashFlowProvider extends ChangeNotifier {
  final Box<CashFlowData> cashFlowBox = Hive.box<CashFlowData>('cashFlowBox');

  /// Lấy danh sách giao dịch từ Box
  List<CashFlowData> get allTransactions => cashFlowBox.values.toList();

  /// Thêm giao dịch vào Box
  void addTransaction(CashFlowData newTransaction) {
    cashFlowBox.add(newTransaction);
    notifyListeners();
  }

  /// Xóa giao dịch khỏi Box
  void removeTransaction(CashFlowData transaction) {
    cashFlowBox.delete(transaction.key);
    notifyListeners();
  }

  /// EXPENSE - INCOME BY DAY
  List<CashFlowData> getTransactionsByDay(DateTime date, {bool? isIncome}) {
    return cashFlowBox.values
        .where((transaction) =>
            transaction.date.day == date.day &&
            transaction.isIncome == isIncome)
        .toList();
  }

  /// SUMMERY EXPENSE - INCOME BY DAY
  int getSummaryTransactionByDay(DateTime date, bool isIncome){
    int sum = 0;
    for (var transaction in cashFlowBox.values) {
      if(transaction.date.day == date.day && transaction.isIncome == isIncome){
        sum += transaction.amount;
      }
    }
    return sum;
  }

  /// DISPARITY (EXPENSE - INCOME) BY DAY
  int getDisparityTransactionByDay(DateTime date){
    int sum = 0;
    for (var transaction in cashFlowBox.values) {
      if(transaction.date.day == date.day && transaction.isIncome == true){
        sum += transaction.amount;
      }
      if(transaction.date.day == date.day && transaction.isIncome == false){
        sum -= transaction.amount;
      }
    }
    return sum;
  }

  /// EXPENSE - INCOME BY MONTH
  List<CashFlowData> getTransactionsByMonth(DateTime date, bool isIncome) {
    return cashFlowBox.values
        .where((transaction) =>
    transaction.date.month == date.month &&
        transaction.isIncome == isIncome)
        .toList();
  }

  /// SUMMERY EXPENSE - INCOME BY MONTH
  int getSummaryTransactionByMonth(DateTime date, {bool? isIncome}){
    int sum = 0;
    for (var transaction in cashFlowBox.values) {
      if(transaction.date.month == date.month && transaction.isIncome == isIncome){
        sum += transaction.amount;
      }
    }
    return sum;
  }

  /// DISPARITY (EXPENSE - INCOME) BY MONTH
  int getDisparityTransactionByMonth(DateTime date){
    int sum = 0;
    for (var transaction in cashFlowBox.values) {
      if(transaction.date.month == date.month && transaction.isIncome == true){
        sum += transaction.amount;
      }
      if(transaction.date.month == date.month && transaction.isIncome == false){
        sum -= transaction.amount;
      }
    }
    return sum;
  }

  /// Summary category transaction by month
  Map<CategoryType, int> summaryCategoryTransactionByMonth(DateTime date, {required bool isIncome}) {
    Map<CategoryType, int> sum = {};
    for (var transaction in cashFlowBox.values) {
      if (transaction.date.month == date.month && transaction.isIncome == isIncome) {
        sum.update(transaction.category, (value) => value + transaction.amount, ifAbsent: () => transaction.amount);
      }
    }
    return sum;
  }

  /// tinh trung binh tung loai
  Map<CategoryType, double> averageCategoryTransactionByMonth(DateTime date, {required bool isIncome}) {
    Map<CategoryType, double> average = {};
    int sum = getSummaryTransactionByMonth(date, isIncome: isIncome);
    Map<CategoryType, int> sumCategory =
        summaryCategoryTransactionByMonth(date, isIncome: isIncome);
    for (var e in sumCategory.keys) {
      average[e] = double.parse((sumCategory[e]! / sum).toStringAsFixed(2));
    }
    return average;
  }

}
