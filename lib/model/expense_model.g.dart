// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpenseModelAdapter extends TypeAdapter<ExpenseModel> {
  @override
  final int typeId = 1;

  @override
  ExpenseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExpenseModel(
      fields[1] as String,
      fields[2] as double,
      fields[3] as DateTime,
      fields[4] as Category,
    );
  }

  @override
  void write(BinaryWriter writer, ExpenseModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.expenseId)
      ..writeByte(1)
      ..write(obj.expenseTitle)
      ..writeByte(2)
      ..write(obj.expenseAmount)
      ..writeByte(3)
      ..write(obj.expenseDateTime)
      ..writeByte(4)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpenseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryAdapter extends TypeAdapter<Category> {
  @override
  final int typeId = 0;

  @override
  Category read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Category.essentials;
      case 1:
        return Category.work;
      case 2:
        return Category.travel;
      case 3:
        return Category.leisure;
      default:
        return Category.essentials;
    }
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    switch (obj) {
      case Category.essentials:
        writer.writeByte(0);
        break;
      case Category.work:
        writer.writeByte(1);
        break;
      case Category.travel:
        writer.writeByte(2);
        break;
      case Category.leisure:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
