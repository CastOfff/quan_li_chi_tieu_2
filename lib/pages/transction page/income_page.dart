import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../category_item/category_income_item.dart';
import '../../core/cash_flow_data.dart';
import '../../core/date_manager.dart';
import '../../providers/cash_flow_provider.dart';
import '../../widget/calendar_filed.dart';
import '../../widget/category_selecter.dart';
import '../../widget/insert_money_field.dart';
import '../../widget/number_format.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({super.key});

  @override
  State<IncomePage> createState() => _IncomePageState();
}
  @override
  initState() {

  }

class _IncomePageState extends State<IncomePage> {
  final List<Map<String, dynamic>> categories = categoriesIncome;
  int selectedCategoryIndex = 0;
  TextEditingController moneyController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final bool isIncome = true;

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
            child: const Text(
              'Danh mục',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
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
                                      category: categoriesIncome[selectedCategoryIndex]['name'],
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
