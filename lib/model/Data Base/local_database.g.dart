// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_database.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DatabaseAdapter extends TypeAdapter<Database> {
  @override
  final int typeId = 1;

  @override
  Database read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Database(
      api: fields[0] as String,
      description: fields[1] as String,
      auth: fields[2] as String,
      http: fields[3] as String,
      cors: fields[4] as String,
      link: fields[5] as String,
      category: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Database obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.api)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.auth)
      ..writeByte(3)
      ..write(obj.http)
      ..writeByte(4)
      ..write(obj.cors)
      ..writeByte(5)
      ..write(obj.link)
      ..writeByte(6)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatabaseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
