import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quan_li_chi_tieu_2/category_item/category_expense_item.dart';

import '../../core/cash_flow_data.dart';
import '../../core/date_manager.dart';
import '../../providers/cash_flow_provider.dart';
import '../../widget/calendar_filed.dart';
import '../../widget/category_selecter.dart';
import '../../widget/insert_money_field.dart';
import '../../widget/number_format.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({super.key});
  @override
  State<ExpensePage> createState() => _ExpensePageState();
}

  @override
  initState() {

  }

class _ExpensePageState extends State<ExpensePage> {
  final List<Map<String, dynamic>> categories = categoriesExpense;
  int selectedCategoryIndex = 0;
  TextEditingController moneyController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final bool isIncome = false;

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CashFlowProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          /// THỜI GIAN
          CalendarFiled(
              onDateChanged: (selectDay) {
                DateManeger().updateDate(selectDay);
                // print('${selectDay.year}, ${selectDay.month}, ${selectDay.day}');
              }
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
            height: 20,
            indent: 20,
            endIndent: 20,
          ),

          /// NHẬP SỐ TIỀN
          InsertMoneyField(moneyController: moneyController, focusNode: focusNode,),

          const Divider(
            thickness: 1,
            color: Colors.grey,
            height: 20,
            indent: 20,
            endIndent: 20,
          ),

          Center(
            heightFactor: 1.5,
            child: Text(
              'Danh mục',
              style: TextStyle(
                fontSize: 20.w,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          /// DANH MỤC
          Flexible(
            flex: 4,
            child: CategorySelecter(
              onCategorySelected: (index) {
                setState(() {
                  selectedCategoryIndex = index;
                });
              },
              selectedCategoryIndex: selectedCategoryIndex,
              categories: categories,
            ),
          ),

          /// NÚT XÁC NHẬN
          Flexible(
            flex: 1,
            child: ElevatedButton(
              onPressed: (){
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Thông báo"),
                        content: Text('Bạn có muốn thêm giao dịch này không?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Không'),
                          ),
                          TextButton(
                            onPressed: () {
                              provider.addTransaction(
                                CashFlowData(
                                  date: DateManeger().selectedDate,
                                  isIncome: isIncome,
                                  amount: NumberFormatter().stringToInt(moneyController.text),
                                  category: categoriesExpense[selectedCategoryIndex]['name'],
                                )
                              );
                              moneyController.clear();
                              Navigator.of(context).pop();
                            },
                            child: Text('Có'),
                          )
                        ]
                      );
                    }
                );
                focusNode.unfocus();
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  )
                ),
                backgroundColor: MaterialStateProperty.all(Colors.deepOrangeAccent),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 0),
                child: Text('Xác nhận',style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),),
              ),
            ),
          ),
          SizedBox(height: 5,)
        ],
      ),
    );
  }
}
