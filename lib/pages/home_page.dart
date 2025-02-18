
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

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;
  List<Widget> pages = [
    TransactionPage(),
    DayTransactionPage(),
    ReportPage(),
    ExtendPage()
  ];
  int currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 4, vsync: this);
    super.initState();
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
          body: TabBarView(
              controller: tabController,
              children: pages),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            iconSize: 30,
            selectedFontSize: 14,
            unselectedFontSize: 14,
            onTap: (value) {
              setState(() {
                currentPage = value;
                tabController.animateTo(value);
              });
            },
            currentIndex: currentPage,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.pending_actions), label: 'Nhập'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month_outlined), label: 'Lịch'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.pie_chart), label: 'báo cáo'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz_outlined), label: 'khác'),
            ],
          ),
        ),
      ],

    );
  }
}
