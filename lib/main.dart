import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:quan_li_chi_tieu_2/pages/home_page.dart';
import 'package:quan_li_chi_tieu_2/pages/transction%20page/transaction_page.dart';
import 'package:quan_li_chi_tieu_2/providers/cash_flow_provider.dart';

import 'core/cash_flow_data.dart';
import 'core/category_type.dart';
import 'core/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// khởi tạo HIVE trong ứng dụng
  await Hive.initFlutter();

  /// add Adapter
  Hive.registerAdapter(CashFlowDataAdapter());
  Hive.registerAdapter(CategoryTypeAdapter());

  ///open Box lưu dữ liệu trong HIVE
  await Hive.openBox<CashFlowData>('cashFlowBox');

  runApp(
    MultiProvider(
      providers: [
        /// khởi tạo CashFlowProvider
        ChangeNotifierProvider(create: (context) => CashFlowProvider(),),
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme(),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
