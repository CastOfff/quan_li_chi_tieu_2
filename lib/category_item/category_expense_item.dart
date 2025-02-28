import '../core/category_type.dart';
import 'default_image.dart';

final DefaultImage defaultImage = DefaultImage();

final List<Map<String, dynamic>> categoriesExpense = [
  {'name': CategoryType.eating, 'image': defaultImage.eating},
  {'name': CategoryType.clothes, 'image': defaultImage.clothes},
  {'name': CategoryType.spending, 'image': defaultImage.spending},
  {'name': CategoryType.cosmetics, 'image': defaultImage.cosmetics},
  {'name': CategoryType.social, 'image': defaultImage.social},
  {'name': CategoryType.healthcare, 'image': defaultImage.healthcare},
  {'name': CategoryType.education, 'image': defaultImage.education},
  {'name': CategoryType.utilities, 'image': defaultImage.utilities},
  {'name': CategoryType.transport, 'image': defaultImage.transport},
  {'name': CategoryType.internet, 'image': defaultImage.internet},
  {'name': CategoryType.rent, 'image': defaultImage.rent},
  {'name': CategoryType.entertainment, 'image': defaultImage.entertainment},
];