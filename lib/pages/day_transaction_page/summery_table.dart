import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../providers/cash_flow_provider.dart';

Widget summeryTable(BuildContext context, DateTime selectDay) {
  final provider = Provider.of<CashFlowProvider>(context);
  return Center(
    child: Container(
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Column(
          children: [
            Text('Tiền chi',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                    color: Colors.redAccent)),
            Text('${provider.getSummaryTransactionByDay(selectDay, false)}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                    color: Colors.redAccent))
          ],
        ),
        Column(
          children: [
            Text('Tiền thu',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                    color: Colors.blueAccent)),
            Text('${provider.getSummaryTransactionByDay(selectDay, true)}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                    color: Colors.blueAccent))
          ],
        ),
        Column(
          children: [
            Text('Tổng',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                    color: provider.getDisparityTransactionByDay(selectDay) > 0
                        ? Colors.blueAccent
                        : Colors.redAccent)),
            Text('${provider.getDisparityTransactionByDay(selectDay)}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                    color: provider.getDisparityTransactionByDay(selectDay) > 0
                        ? Colors.blueAccent
                        : Colors.redAccent))
          ],
        ),
      ]),
    ),
  );
}
