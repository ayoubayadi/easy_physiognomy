import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/question.dart';

class QuestionNotifier extends StateNotifier<QuestionState> {
  QuestionNotifier() : super(QuestionState());
  
  void selectOption(int questionIndex, int optionIndex) {
    state = state.copyWith(
      questions: List.from(state.questions)..[questionIndex].selectedOptionIndex = optionIndex,
    );
  }
  
  void next() {
    if (state.canGoNext) {
      state = state.copyWith(currentIndex: state.currentIndex + 1);
    }
  }
  
  void previous() {
    if (state.canGoPrevious) {
      state = state.copyWith(currentIndex: state.currentIndex - 1);
    }
  }
  
  void reset() {
    state = QuestionState();
  }
}

class QuestionState {
  final List<Question> questions;
  final int currentIndex;
  
  QuestionState({
    List<Question>? questions,
    this.currentIndex = 0,
  }) : questions = questions ?? _createQuestions();
  
  static List<Question> _createQuestions() {
    return [
      // Upper Section - 3 questions
      Question(
        id: 'upper_length',
        section: Section.upper,
        questionKey: 'questionUpperLength',
        options: const [
          Option(key: 'long', labelKey: 'optionLong', resultKey: 'resultUpperLong'),
          Option(key: 'medium', labelKey: 'optionMedium', resultKey: 'resultUpperMedium'),
          Option(key: 'short', labelKey: 'optionShort', resultKey: 'resultUpperShort'),
        ],
      ),
      Question(
        id: 'forehead_width',
        section: Section.upper,
        questionKey: 'questionForeheadWidth',
        options: const [
          Option(key: 'wide', labelKey: 'optionWide', resultKey: 'resultForeheadWide'),
          Option(key: 'medium', labelKey: 'optionMedium', resultKey: 'resultForeheadMedium'),
          Option(key: 'narrow', labelKey: 'optionNarrow', resultKey: 'resultForeheadNarrow'),
        ],
      ),
      Question(
        id: 'hairline_shape',
        section: Section.upper,
        questionKey: 'questionHairlineShape',
        options: const [
          Option(key: 'straight', labelKey: 'optionStraight', resultKey: 'resultHairlineStraight'),
          Option(key: 'curved', labelKey: 'optionCurved', resultKey: 'resultHairlineCurved'),
          Option(key: 'widows_peak', labelKey: 'optionWidowsPeak', resultKey: 'resultHairlineWidowsPeak'),
        ],
      ),
    ];
  }
  
  Question get currentQuestion => questions[currentIndex];
  
  bool get canGoNext => currentQuestion.isAnswered && currentIndex < questions.length - 1;
  bool get canGoPrevious => currentIndex > 0;
  bool get isLastQuestion => currentIndex == questions.length - 1;
  bool get isComplete => questions.every((q) => q.isAnswered);
  
  String get currentSectionKey {
    final section = currentQuestion.section;
    switch (section) {
      case Section.upper: return 'sectionUpper';
      case Section.middle: return 'sectionMiddle';
      case Section.lower: return 'sectionLower';
    }
  }
  
  QuestionState copyWith({
    List<Question>? questions,
    int? currentIndex,
  }) {
    return QuestionState(
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}

final questionProvider = StateNotifierProvider<QuestionNotifier, QuestionState>((ref) {
  return QuestionNotifier();
});
