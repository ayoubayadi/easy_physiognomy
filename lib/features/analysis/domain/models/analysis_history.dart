import 'package:hive/hive.dart';

part 'analysis_history.g.dart';

@HiveType(typeId: 0)
class AnalysisHistory extends HiveObject {
  @HiveField(0)
  String id;
  
  @HiveField(1)
  DateTime timestamp;
  
  @HiveField(2)
  Map<String, int> answers;
  
  @HiveField(3)
  String language;
  
  @HiveField(4)
  int totalQuestions;
  
  @HiveField(5)
  int answeredCount;
  
  @HiveField(6, defaultValue: [])
  List<String> topTraits;
  
  @HiveField(7, defaultValue: '')
  String personalityText;
  
  @HiveField(8, defaultValue: '')
  String upperSectionText;
  
  @HiveField(9, defaultValue: '')
  String middleSectionText;
  
  @HiveField(10, defaultValue: '')
  String lowerSectionText;
  
  AnalysisHistory({
    required this.id,
    required this.timestamp,
    required this.answers,
    required this.language,
    required this.totalQuestions,
    required this.answeredCount,
    this.topTraits = const [],
    this.personalityText = '',
    this.upperSectionText = '',
    this.middleSectionText = '',
    this.lowerSectionText = '',
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
