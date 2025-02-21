import 'package:flutter/material.dart';
import 'package:quan_li_chi_tieu_2/widget/calender_widget.dart';
import 'package:quan_li_chi_tieu_2/widget/number_format.dart';
import 'package:table_calendar/table_calendar.dart';
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
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar( title: Text('Thu chi theo ngày'),),
      body: Column(
        children: [
          CalenderWidget(
              focusDay: focusDay,
              selectedDay: selectDay,
              onDaySelected: onDaySelected,
              onPageChanged: (focusedDay) {
                setState(() => focusDay = focusedDay);
              }
          )
        ],
      ),
    );
  }
}
