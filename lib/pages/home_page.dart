import 'package:flutter/material.dart';
import 'package:quan_li_chi_tieu_2/pages/day_transaction_page.dart';
import 'package:quan_li_chi_tieu_2/pages/report_page.dart';
import 'package:quan_li_chi_tieu_2/pages/transction%20page/transaction_page.dart';

import 'extend_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  List<Widget> pages = [
    TransactionPage(),
    DayTransactionPage(),
    ReportPage(),
    ExtendPage()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void onItemTapped(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/wallpaper.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: pages.elementAt(currentPage),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            iconSize: 30,
            selectedFontSize: 14,
            unselectedFontSize: 14,
            onTap: onItemTapped,
            currentIndex: currentPage,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.pending_actions, size: 24,), label: 'Nhập'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month_outlined, size: 24,), label: 'Ngày'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.pie_chart, size: 24,), label: 'Báo cáo'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz_outlined, size: 24,), label: 'Thêm'),
            ],
          ),
        ),
      ],

    );
  }
}
