import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quan_li_chi_tieu_2/widget/number_format.dart';

class InsertMoneyField extends StatefulWidget {
  final TextEditingController moneyController;
  final FocusNode focusNode;
  const InsertMoneyField({
    super.key,
    required this.moneyController,
    required this.focusNode,
  });

  @override
  State<InsertMoneyField> createState() => _InsertMoneyFieldState();
}

class _InsertMoneyFieldState extends State<InsertMoneyField> {
  /// formatMoney
  void onMoneyChanged(String? money) {
    if (money == '') {
      widget.moneyController.text = '0';
      return;
    }
    int number = NumberFormatter().stringToInt(money ?? '0');
    widget.moneyController.text = NumberFormatter().formatMoney(number);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 6.w, left: 10.w, right: 10.w),
      padding: EdgeInsets.only(left: 8.w),
      child: Row(children: [
        Expanded(
          flex: 3,
          child: Text(
            'Số Tiền',
            style: Theme.of(context).textTheme.titleMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
            flex: 14,
            child: Padding(
              padding: EdgeInsets.only(left: 1.w, right: 8.w),
              child: TextFormField(
                // onTapOutside: (event) {
                //   FocusManager.instance.primaryFocus?.unfocus();
                // },
                focusNode: widget.focusNode,
                controller: widget.moneyController,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        left: 12.w, right: 8.w, top: 4.w, bottom: 4.w),
                    filled: true,
                    fillColor: const Color(0xfff8e4dc),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xffe29c80)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none
                    ),
                    hintText: 'Nhập số tiền',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                    )
                ),
                onChanged: (valuer) {
                  return onMoneyChanged(valuer);
                },
              ),
            )
        ),
        Text(
          'đ',
          style: TextStyle(
            fontSize: 16.sp,
            decoration: TextDecoration.underline,
          ),
        )
      ]),
    );
  }
}
