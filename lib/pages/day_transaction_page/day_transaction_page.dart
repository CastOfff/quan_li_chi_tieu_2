import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quan_li_chi_tieu_2/pages/day_transaction_page/summery_table.dart';
import 'package:quan_li_chi_tieu_2/widget/calender_widget.dart';
import 'day_expense_transaction_page.dart';
import 'day_income_transaction_page.dart';

class DayTransactionPage extends StatefulWidget {
  const DayTransactionPage({super.key});

  @override
  State<DayTransactionPage> createState() => _DayTransactionPageState();
}

class _DayTransactionPageState extends State<DayTransactionPage> with SingleTickerProviderStateMixin{
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
    //final provider = Provider.of<CashFlowProvider>(context);
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

          Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    '${selectDay.day}/${selectDay.month < 10 ? '0${selectDay.month}' : selectDay.month}',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                )
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DayIncomeTransactionPage(
                    selectDay: selectDay,
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  DayExpenseTransactionPage(
                    selectDay: selectDay,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
