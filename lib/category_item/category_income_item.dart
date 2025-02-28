import '../core/category_type.dart';
import 'package:quan_li_chi_tieu_2/category_item/default_image.dart';

final DefaultImage defaultImage = DefaultImage();

final List<Map<String, dynamic>> categoriesIncome = [
  {'name': CategoryType.salary, 'image': defaultImage.salary},
  {'name': CategoryType.allowance, 'image': defaultImage.allowance},
  {'name': CategoryType.bonus, 'image': defaultImage.bonus},
  {'name': CategoryType.investment, 'image': defaultImage.investment},
  {'name': CategoryType.sideIncome, 'image': defaultImage.sideIncome},
  {'name': CategoryType.temporaryIncome, 'image': defaultImage.temporaryIncome},
];