// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cash_flow_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CashFlowDataAdapter extends TypeAdapter<CashFlowData> {
  @override
  final int typeId = 0;

  @override
  CashFlowData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CashFlowData(
      date: fields[0] as DateTime,
      isIncome: fields[1] as bool,
      amount: (fields[2] as num).toInt(),
      category: fields[3] as CategoryType,
    );
  }

  @override
  void write(BinaryWriter writer, CashFlowData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.isIncome)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CashFlowDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
