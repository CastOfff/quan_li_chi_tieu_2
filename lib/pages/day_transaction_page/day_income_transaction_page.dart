import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../category_item/category_income_item.dart';
import '../../providers/cash_flow_provider.dart';
import '../../widget/number_format.dart';

class DayIncomeTransactionPage extends StatefulWidget {
  final DateTime selectDay;

  const DayIncomeTransactionPage({super.key, required this.selectDay});

  @override
  State<DayIncomeTransactionPage> createState() =>
      _DayIncomeTransactionPageState();
}

class _DayIncomeTransactionPageState extends State<DayIncomeTransactionPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CashFlowProvider>(context);
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: provider
          .getTransactionsByDay(widget.selectDay, isIncome: true)
          .length,
      itemBuilder: (context, index) {
        var cashFlowData = provider.getTransactionsByDay(widget.selectDay,
            isIncome: true)[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            //spacing: 12.w,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 12.w,
                children: [
                  Image(
                    width: 28.w,
                    height: 28.w,
                    fit: BoxFit.cover,
                    image: categoriesIncome[categoriesIncome.indexWhere((element) =>
                    element['name'] == cashFlowData.category)]['image'],
                  ),
                  Text(
                    cashFlowData.category.description,
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '${NumberFormatter().formatMoney(cashFlowData.amount)} đ',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                      color: Colors.blueAccent,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.delete,
                    ),
                    onPressed: () {
                      provider.removeTransaction(cashFlowData);
                    },
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
