// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'corporate.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CorporateAdapter extends TypeAdapter<Corporate> {
  @override
  final int typeId = 1;

  @override
  Corporate read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Corporate(
      businessName: fields[0] as String,
      businessAddress: fields[1] as String,
      position: fields[2] as String,
      workDuration: fields[3] as String,
      incomeSource: fields[4] as String,
      bank: fields[5] as String,
      bankBranch: fields[6] as String,
      accountNumber: fields[7] as String,
      accountHolderName: fields[8] as String,
      grossIncome: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Corporate obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.businessName)
      ..writeByte(1)
      ..write(obj.businessAddress)
      ..writeByte(2)
      ..write(obj.position)
      ..writeByte(3)
      ..write(obj.workDuration)
      ..writeByte(4)
      ..write(obj.incomeSource)
      ..writeByte(5)
      ..write(obj.bank)
      ..writeByte(6)
      ..write(obj.bankBranch)
      ..writeByte(7)
      ..write(obj.accountNumber)
      ..writeByte(8)
      ..write(obj.accountHolderName)
      ..writeByte(9)
      ..write(obj.grossIncome);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CorporateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
