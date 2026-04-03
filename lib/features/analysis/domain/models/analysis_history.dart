import 'package:hive/hive.dart';

part 'analysis_history.g.dart';

@HiveType(typeId: 0)
class AnalysisHistory extends HiveObject {
  @HiveField(0)
  String id;
  
  @HiveField(1)
  DateTime timestamp;
  
  @HiveField(2)
  Map<String, int> answers; // questionId -> selectedOptionIndex
  
  @HiveField(3)
  String language; // 'ar' or 'en'
  
  @HiveField(4)
  int totalQuestions;
  
  @HiveField(5)
  int answeredCount;
  
  AnalysisHistory({
    required this.id,
    required this.timestamp,
    required this.answers,
    required this.language,
    required this.totalQuestions,
    required this.answeredCount,
  });
  
  String get formattedDate {
    final day = timestamp.day.toString().padLeft(2, '0');
    final month = timestamp.month.toString().padLeft(2, '0');
    final year = timestamp.year.toString();
    final hour = timestamp.hour.toString().padLeft(2, '0');
    final minute = timestamp.minute.toString().padLeft(2, '0');
    return '$day/$month/$year - $hour:$minute';
  }
  
  double get completionPercentage => answeredCount / totalQuestions;
}
