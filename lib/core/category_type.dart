import 'package:hive_ce/hive.dart';
part 'category_type.g.dart';

@HiveType(typeId: 1)
enum CategoryType {
  @HiveField(0) eating,
  @HiveField(1) clothes,
  @HiveField(2) spending,
  @HiveField(3) cosmetics,
  @HiveField(4) social,
  @HiveField(5) healthcare,
  @HiveField(6) education,
  @HiveField(7) utilities,
  @HiveField(8) transport,
  @HiveField(9) internet,
  @HiveField(10) rent,
  @HiveField(11) entertainment,
  @HiveField(12) salary,
  @HiveField(13) allowance,
  @HiveField(14) bonus,
  @HiveField(15) investment,
  @HiveField(16) sideIncome,
  @HiveField(17) temporaryIncome;

  static const Map<CategoryType, String> descriptions = {
    eating: 'Ăn uống',
    clothes: 'Quần áo',
    spending: 'Chi tiêu hàng ngày',
    cosmetics: 'Mỹ phẩm',
    social: 'giao lưu',
    healthcare: 'Y tế',
    education: 'Giáo dục',
    utilities: 'Điện nước',
    transport: 'Đi lại',
    internet: 'Mạng',
    rent: 'Tiền nhà',
    entertainment: 'Giải trí',
    salary: 'Tiền lương',
    allowance: 'Tiền phụ cấp',
    bonus: 'Tiền thưởng',
    investment: 'Đầu tư',
    sideIncome: 'Thu nhập phụ',
    temporaryIncome: 'Thu nhập tạm thời',
  };

  String get description => descriptions[this] ?? '';
}
