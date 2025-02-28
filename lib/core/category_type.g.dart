// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryTypeAdapter extends TypeAdapter<CategoryType> {
  @override
  final int typeId = 1;

  @override
  CategoryType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return CategoryType.eating;
      case 1:
        return CategoryType.clothes;
      case 2:
        return CategoryType.spending;
      case 3:
        return CategoryType.cosmetics;
      case 4:
        return CategoryType.social;
      case 5:
        return CategoryType.healthcare;
      case 6:
        return CategoryType.education;
      case 7:
        return CategoryType.utilities;
      case 8:
        return CategoryType.transport;
      case 9:
        return CategoryType.internet;
      case 10:
        return CategoryType.rent;
      case 11:
        return CategoryType.entertainment;
      case 12:
        return CategoryType.salary;
      case 13:
        return CategoryType.allowance;
      case 14:
        return CategoryType.bonus;
      case 15:
        return CategoryType.investment;
      case 16:
        return CategoryType.sideIncome;
      case 17:
        return CategoryType.temporaryIncome;
      default:
        return CategoryType.eating;
    }
  }

  @override
  void write(BinaryWriter writer, CategoryType obj) {
    switch (obj) {
      case CategoryType.eating:
        writer.writeByte(0);
      case CategoryType.clothes:
        writer.writeByte(1);
      case CategoryType.spending:
        writer.writeByte(2);
      case CategoryType.cosmetics:
        writer.writeByte(3);
      case CategoryType.social:
        writer.writeByte(4);
      case CategoryType.healthcare:
        writer.writeByte(5);
      case CategoryType.education:
        writer.writeByte(6);
      case CategoryType.utilities:
        writer.writeByte(7);
      case CategoryType.transport:
        writer.writeByte(8);
      case CategoryType.internet:
        writer.writeByte(9);
      case CategoryType.rent:
        writer.writeByte(10);
      case CategoryType.entertainment:
        writer.writeByte(11);
      case CategoryType.salary:
        writer.writeByte(12);
      case CategoryType.allowance:
        writer.writeByte(13);
      case CategoryType.bonus:
        writer.writeByte(14);
      case CategoryType.investment:
        writer.writeByte(15);
      case CategoryType.sideIncome:
        writer.writeByte(16);
      case CategoryType.temporaryIncome:
        writer.writeByte(17);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
