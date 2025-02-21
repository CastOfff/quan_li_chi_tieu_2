import 'package:flutter/material.dart';

class CalendarFiled extends StatefulWidget {
  final ValueChanged<DateTime>? onDateChanged;
  const CalendarFiled({
    super.key,
    this.onDateChanged,
  });

  @override
  State<CalendarFiled> createState() => _CalendarFiledState();
}

class _CalendarFiledState extends State<CalendarFiled> {
  late int day;
  late int month;
  late int year;
  late String weekday;


  /// CẤU HÌNH NGÀY ĐƯỢC CHỌN
  void getDay(DateTime? date) {
    date ??= DateTime.now();
    day = date.day;
    month = date.month;
    year = date.year;

    List<String> days = ['Thứ 2', 'Thứ 3', 'Thứ 4', 'Thứ 5', 'Thứ 6', 'Thứ 7', 'Chủ nhật'];
    weekday = days[date.weekday - 1];
  }

  /// CHỌN NGÀY
  Future<void> selectDay() async {
    final DateTime currentDate = DateTime(year, month, day);
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2025),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        getDay(picked);
      });
      if (widget.onDateChanged != null) {
        widget.onDateChanged!(picked);
      }
    }
  }

  DateTime getSelectedDate() {
    return DateTime(year, month, day);
  }

  @override
  void initState() {
    super.initState();
    getDay(DateTime.now());
    if (widget.onDateChanged != null) {
      widget.onDateChanged!(DateTime(year, month, day));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 6.0, left: 10.0, right: 10.0),
      padding: EdgeInsets.only(left: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              'Ngày',
              style: Theme.of(context).textTheme.titleMedium
              ),
          ),
          Expanded(
            flex: 5,
              child: Container(
                margin: EdgeInsets.only(left: 8.0, right: 8.0),
                padding: EdgeInsets.only(left: 12.0, right: 8.0, top:4.0, bottom: 4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xfff8e4dc),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('$weekday, $day/$month/$year', style: Theme.of(context).textTheme.titleMedium,),
                    SizedBox(width: 10),
                    IconButton(
                      onPressed: selectDay,
                      icon: Icon(Icons.calendar_month_outlined, color: Colors.orange),
                    ),
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}
