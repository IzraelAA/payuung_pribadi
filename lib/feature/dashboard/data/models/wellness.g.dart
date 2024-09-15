// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wellness.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WellnessAdapter extends TypeAdapter<Wellness> {
  @override
  final int typeId = 3;

  @override
  Wellness read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Wellness(
      imageUrl: fields[0] as String,
      title: fields[1] as String,
      price: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Wellness obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.imageUrl)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WellnessAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
