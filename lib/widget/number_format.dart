import 'package:intl/intl.dart';
class NumberFormatter{
  /// format định dạng int
  final NumberFormat moneyFormat = NumberFormat('#,###');

  /// format money
  String formatMoney(int? money){

    if (money == null) {
      return moneyFormat.format(0);
    }
    return moneyFormat.format(money);
  }

  /// từ int sang String
  String stringToMoney(int money){
    return moneyFormat.format(money);
  }

  /// từ String sang int
  int stringToInt(String moneyString){
    if (moneyString == '') {
      return 0;
    }
    return int.parse(moneyString.replaceAll(',', '')) ?? 0;
  }
}