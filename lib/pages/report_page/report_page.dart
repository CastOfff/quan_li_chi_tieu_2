import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quan_li_chi_tieu_2/core/category_type.dart';
import 'package:quan_li_chi_tieu_2/pages/report_page/section_color.dart';

import '../../category_item/category_expense_item.dart';
import '../../providers/cash_flow_provider.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CashFlowProvider>(context);
    final listTitleExpense = provider.averageCategoryTransactionByMonth(DateTime.now(), isIncome: false);
    final listDataExpense = provider.summaryCategoryTransactionByMonth(DateTime.now(), isIncome: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Báo cáo chi tiêu')
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.redAccent.withValues(alpha: 0.05),
              height: 220.h,
              width: double.infinity,
              child: Row(
                children: [
                  /// PIE CHART
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 160.w,
                      height: 160.h,
                      child: PieChart(
                        PieChartData(
                          sections: List<PieChartSectionData>.generate(
                              listTitleExpense.length,
                                (index) => PieChartSectionData(
                                  value: listDataExpense.values.elementAt(index).toDouble(),
                                  title: '${(listTitleExpense.entries.elementAt(index).value * 100).toStringAsFixed(1)}%',
                                  color: sectionColors[index],
                                  radius: 50,
                                  titleStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                          ),
                          sectionsSpace: 2,
                          centerSpaceRadius: 40,
                        ),
                        duration: Duration(milliseconds: 150),
                        curve: Curves.linear,
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w,),
                  /// DANH MUC
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5,
                      children: List.generate(
                          listTitleExpense.length,
                              (index) => Row(
                            children: [
                              Container(
                                width: 15,
                                height: 15,
                                color: sectionColors[index],
                              ),
                              SizedBox(width: 10,),
                              Text(
                                  listTitleExpense.keys.elementAt(index).description,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  )
                              ),
                            ],
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Text('${provider.averageCategoryTransactionByMonth(DateTime.now(), isIncome: false)}')
          ],
        ),
      )
      ,
    );
  }
}
