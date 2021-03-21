// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetItem.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FishAdapter extends TypeAdapter<Fish> {
  @override
  final int typeId = 0;

  @override
  Fish read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Fish(
      fields[0] as String,
      fields[1] as String,
      fields[2] as bool,
      fields[3] as String,
      fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Fish obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.isFav)
      ..writeByte(3)
      ..write(obj.lat)
      ..writeByte(4)
      ..write(obj.long);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FishAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
