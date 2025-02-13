import 'package:flutter/material.dart';
import '../core/cash_flow_data.dart';

class ListData extends ChangeNotifier{
  List<CashFlowData> data;
  ListData({required this.data});

  void addCashFlowData(CashFlowData cashFlowData) {
    data.add(cashFlowData);
  }

  void removeCashFlowData(CashFlowData cashFlowData){
    data.removeWhere((element) => element == cashFlowData);
  }
}