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
}
// class CashFlowProvider extends ChangeNotifier {
//   ListData cashFlowData = data;
//
//   void addTransaction({
//     required DateTime date,
//     required bool isIncome,
//     required int amount,
//     required CategoryType category,
//   }) {
//     // Tạo đối tượng CashFlowData mới với thông tin giao dịch
//     final newTransaction = CashFlowData(
//       date: date,
//       isIncome: isIncome,
//       amount: amount,
//       category: category,
//     );
//
//     // Thêm giao dịch vào danh sách
//     cashFlowData.addCashFlowData(newTransaction);
//     cashFlowData.notifyListeners();
//   }
//
//   void removeTransaction(CashFlowData transaction) {
//     cashFlowData.removeCashFlowData(transaction);
//     notifyListeners();
//   }
// }
