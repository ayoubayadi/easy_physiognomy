enum Section { upper, middle, lower }

class Option {
  final String key;
  final String labelKey;
  final String resultKey;
  
  const Option({
    required this.key,
    required this.labelKey,
    required this.resultKey,
  });
}

class Question {
  final String id;
  final Section section;
  final String questionKey;
  final List<Option> options;
  int? selectedOptionIndex;
  
  Question({
    required this.id,
    required this.section,
    required this.questionKey,
    required this.options,
    this.selectedOptionIndex,
  });
  
  bool get isAnswered => selectedOptionIndex != null;
  
  Option? get selectedOption => 
    selectedOptionIndex != null ? options[selectedOptionIndex!] : null;
}
