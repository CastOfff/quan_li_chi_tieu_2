import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderWidget extends StatelessWidget {
  final DateTime focusDay;
  final DateTime? selectedDay;
  final Function(DateTime, DateTime) onDaySelected;
  final Function(DateTime) onPageChanged;


  const CalenderWidget({
    super.key,
    required this.focusDay,
    required this.selectedDay,
    required this.onDaySelected,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: focusDay,
      firstDay: DateTime.utc(2025),
      lastDay: DateTime(2026),

      daysOfWeekStyle: DaysOfWeekStyle(
        decoration: BoxDecoration(
          color: Color(0xfffff1e5),
          borderRadius: BorderRadius.circular(10),
        )
      ),
      /// Tieu de
      headerVisible: true,
      headerStyle: HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
      ),

      /// Style table
      calendarStyle: CalendarStyle(
        weekendTextStyle: TextStyle(color: Colors.red),
        tablePadding: EdgeInsets.all(1),
        tableBorder: TableBorder.symmetric(
          inside: BorderSide(color: Color(0xffcdeeff), width: 1),
          outside: BorderSide(color: Color(0xffcdeeff), width: 2),
        ),
      ),

      daysOfWeekHeight: 30,
      calendarFormat: CalendarFormat.month, /// giao dien lich
      selectedDayPredicate: (day) => isSameDay(selectedDay, day),
      onDaySelected: onDaySelected,
      onPageChanged: onPageChanged,
    );
  }
}
