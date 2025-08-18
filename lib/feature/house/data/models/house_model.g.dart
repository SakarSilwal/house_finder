// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HouseModelAdapter extends TypeAdapter<HouseModel> {
  @override
  final int typeId = 0;

  @override
  HouseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HouseModel(
      id: fields[0] as String,
      name: fields[1] as String,
      houseColours: fields[2] as String,
      founder: fields[3] as String,
      animal: fields[4] as String,
      element: fields[5] as String,
      ghost: fields[6] as String,
      commonRoom: fields[7] as String,
    );
  }


  @override
  void write(BinaryWriter writer, HouseModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.houseColours)
      ..writeByte(3)
      ..write(obj.founder)
      ..writeByte(4)
      ..write(obj.animal)
      ..writeByte(5)
      ..write(obj.element)
      ..writeByte(6)
      ..write(obj.ghost)
      ..writeByte(7)
      ..write(obj.commonRoom);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HouseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
