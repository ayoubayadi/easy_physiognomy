// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_history.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnalysisHistoryAdapter extends TypeAdapter<AnalysisHistory> {
  @override
  final int typeId = 0;

  @override
  AnalysisHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnalysisHistory(
      id: fields[0] as String,
      timestamp: fields[1] as DateTime,
      answers: (fields[2] as Map).cast<String, int>(),
      language: fields[3] as String,
      totalQuestions: fields[4] as int,
      answeredCount: fields[5] as int,
      topTraits: fields[6] == null ? [] : (fields[6] as List).cast<String>(),
      personalityText: fields[7] == null ? '' : fields[7] as String,
      upperSectionText: fields[8] == null ? '' : fields[8] as String,
      middleSectionText: fields[9] == null ? '' : fields[9] as String,
      lowerSectionText: fields[10] == null ? '' : fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AnalysisHistory obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.timestamp)
      ..writeByte(2)
      ..write(obj.answers)
      ..writeByte(3)
      ..write(obj.language)
      ..writeByte(4)
      ..write(obj.totalQuestions)
      ..writeByte(5)
      ..write(obj.answeredCount)
      ..writeByte(6)
      ..write(obj.topTraits)
      ..writeByte(7)
      ..write(obj.personalityText)
      ..writeByte(8)
      ..write(obj.upperSectionText)
      ..writeByte(9)
      ..write(obj.middleSectionText)
      ..writeByte(10)
      ..write(obj.lowerSectionText);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnalysisHistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
