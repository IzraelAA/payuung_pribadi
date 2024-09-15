// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressAdapter extends TypeAdapter<Address> {
  @override
  final int typeId = 2;

  @override
  Address read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Address(
      nik: fields[0] as String,
      address: fields[1] as String,
      postalCode: fields[2] as String,
      province: fields[3] as String,
      district: fields[4] as String,
      subDistrict: fields[5] as String,
      village: fields[6] as String,
      ktpImagePath: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Address obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.nik)
      ..writeByte(1)
      ..write(obj.address)
      ..writeByte(2)
      ..write(obj.postalCode)
      ..writeByte(3)
      ..write(obj.province)
      ..writeByte(4)
      ..write(obj.district)
      ..writeByte(5)
      ..write(obj.subDistrict)
      ..writeByte(6)
      ..write(obj.village)
      ..writeByte(7)
      ..write(obj.ktpImagePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
