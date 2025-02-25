import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';

import '../core/cash_flow_data.dart';

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
  List<CashFlowData> getTransactionsByDay(DateTime date, bool isIncome) {
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
  int getSummaryTransactionByMonth(DateTime date, bool isIncome){
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
}
