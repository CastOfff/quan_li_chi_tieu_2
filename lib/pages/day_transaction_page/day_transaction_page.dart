import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:quan_li_chi_tieu_2/category_item/category_income_item.dart';
import 'package:quan_li_chi_tieu_2/pages/day_transaction_page/summery_table.dart';
import 'package:quan_li_chi_tieu_2/widget/calender_widget.dart';
import 'package:quan_li_chi_tieu_2/widget/number_format.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../category_item/category_expense_item.dart';
import '../../providers/cash_flow_provider.dart';

class DayTransactionPage extends StatefulWidget {
  const DayTransactionPage({super.key});

  @override
  State<DayTransactionPage> createState() => _DayTransactionPageState();
}

class _DayTransactionPageState extends State<DayTransactionPage> {
  DateTime focusDay = DateTime.now();
  DateTime selectDay = DateTime.now();

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      selectDay = selectedDay;
      focusDay = focusedDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CashFlowProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Thu chi theo ngày'),),
      body: Column(
        children: [

          /// FOCUSED CALENDAR
          CalenderWidget(
              focusDay: focusDay,
              selectedDay: selectDay,
              onDaySelected: onDaySelected,
              onPageChanged: (focusedDay) {
                setState(() => focusDay = focusedDay);
              }
          ),

          /// Thống kê chi tiêu trong ngày
          summeryTable(context, selectDay),

          Text('Danh sach thu', style: TextStyle(fontSize: 14.sp),),

          Expanded(
            child: ListView.builder(
              itemCount: provider
                  .getTransactionsByDay(selectDay, true)
                  .length,
              itemBuilder: (context, index) {
                var cashFlowData = provider.getTransactionsByDay(
                    selectDay, true)[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    //spacing: 12.w,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 12.w,
                        children: [
                          Icon(
                            categoriesIncome[categoriesIncome.indexWhere(
                                    (element) =>
                                        element['name'] == cashFlowData.category)]
                                ['icon'],
                            color: categoriesIncome[categoriesIncome.indexWhere(
                                    (element) =>
                                element['name'] == cashFlowData.category)]
                            ['color'],
                            size: 20.sp,
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
                            '${NumberFormatter().formatMoney(cashFlowData.amount)} VND',
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.blueAccent,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete,),
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
            ),
          ),

          Text('Danh sach chi', style: TextStyle(fontSize: 14.sp),),
          Expanded(
            child: ListView.builder(
              itemCount: provider
                  .getTransactionsByDay(selectDay, false)
                  .length,
              itemBuilder: (context, index) {
                var cashFlowData = provider.getTransactionsByDay(
                    selectDay, false)[index];
                return ListTile(
                    title: Text('${cashFlowData.amount} VND'),
                    subtitle: Text(
                        cashFlowData.category.description
                    ),

                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        provider.removeTransaction(cashFlowData);
                      },
                    )
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
