import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/question.dart';

class QuestionNotifier extends StateNotifier<QuestionState> {
  static const String _boxName = 'analysis_answers';
  static const String _currentIndexKey = 'current_index';
  
  QuestionNotifier() : super(QuestionState()) {
    _loadFromHive();
  }
  
  Future<void> _loadFromHive() async {
    try {
      final box = await Hive.openBox(_boxName);
      final loadedQuestions = <Question>[];
      
      for (int i = 0; i < state.questions.length; i++) {
        final question = state.questions[i];
        final savedIndex = box.get('${question.id}_selected');
        if (savedIndex != null) {
          question.selectedOptionIndex = savedIndex;
        }
        loadedQuestions.add(question);
      }
      
      final savedIndex = box.get(_currentIndexKey, defaultValue: 0);
      
      state = QuestionState(
        questions: loadedQuestions,
        currentIndex: savedIndex,
      );
    } catch (e) {
      // If Hive fails, use default state
      debugLoadError(e);
    }
  }
  
  Future<void> _saveToHive() async {
    try {
      final box = await Hive.openBox(_boxName);
      for (final question in state.questions) {
        if (question.selectedOptionIndex != null) {
          await box.put('${question.id}_selected', question.selectedOptionIndex);
        }
      }
      await box.put(_currentIndexKey, state.currentIndex);
    } catch (e) {
      debugSaveError(e);
    }
  }
  
  Future<void> selectOption(int questionIndex, int optionIndex) async {
    final updatedQuestions = List<Question>.from(state.questions);
    updatedQuestions[questionIndex].selectedOptionIndex = optionIndex;
    
    state = state.copyWith(questions: updatedQuestions);
    await _saveToHive();
  }
  
  Future<void> next() async {
    if (state.canGoNext) {
      state = state.copyWith(currentIndex: state.currentIndex + 1);
      await _saveToHive();
    }
  }
  
  Future<void> previous() async {
    if (state.canGoPrevious) {
      state = state.copyWith(currentIndex: state.currentIndex - 1);
      await _saveToHive();
    }
  }
  
  Future<void> reset() async {
    state = QuestionState();
    try {
      final box = await Hive.openBox(_boxName);
      await box.clear();
    } catch (e) {
      debugResetError(e);
    }
  }
  
  void debugLoadError(dynamic e) {
    // Silent fail for now - can add logging later
  }
  
  void debugSaveError(dynamic e) {
    // Silent fail for now - can add logging later
  }
  
  void debugResetError(dynamic e) {
    // Silent fail for now - can add logging later
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
      // Middle Section - 8 questions
      Question(
        id: 'eyebrows',
        section: Section.middle,
        questionKey: 'questionEyebrows',
        options: const [
          Option(key: 'thin', labelKey: 'optionThin', resultKey: 'resultEyebrowsThin'),
          Option(key: 'thick', labelKey: 'optionThick', resultKey: 'resultEyebrowsThick'),
          Option(key: 'connected', labelKey: 'optionConnected', resultKey: 'resultEyebrowsConnected'),
          Option(key: 'partially_connected', labelKey: 'optionPartiallyConnected', resultKey: 'resultEyebrowsPartiallyConnected'),
          Option(key: 'separated', labelKey: 'optionSeparated', resultKey: 'resultEyebrowsSeparated'),
          Option(key: 'straight', labelKey: 'optionStraight', resultKey: 'resultEyebrowsStraight'),
          Option(key: 'arched', labelKey: 'optionArched', resultKey: 'resultEyebrowsArched'),
          Option(key: 'mountain', labelKey: 'optionMountain', resultKey: 'resultEyebrowsMountain'),
        ],
      ),
      Question(
        id: 'eyes',
        section: Section.middle,
        questionKey: 'questionEyes',
        options: const [
          Option(key: 'protruding', labelKey: 'optionProtruding', resultKey: 'resultEyesProtruding'),
          Option(key: 'small', labelKey: 'optionSmall', resultKey: 'resultEyesSmall'),
          Option(key: 'medium', labelKey: 'optionMedium', resultKey: 'resultEyesMedium'),
          Option(key: 'large', labelKey: 'optionLarge', resultKey: 'resultEyesLarge'),
          Option(key: 'deep_set', labelKey: 'optionDeepSet', resultKey: 'resultEyesDeepSet'),
          Option(key: 'round', labelKey: 'optionRound', resultKey: 'resultEyesRound'),
          Option(key: 'almond', labelKey: 'optionAlmond', resultKey: 'resultEyesAlmond'),
        ],
      ),
      Question(
        id: 'eye_distance',
        section: Section.middle,
        questionKey: 'questionEyeDistance',
        options: const [
          Option(key: 'wide_apart', labelKey: 'optionWideApart', resultKey: 'resultEyeDistanceWide'),
          Option(key: 'medium', labelKey: 'optionMedium', resultKey: 'resultEyeDistanceMedium'),
          Option(key: 'close_together', labelKey: 'optionCloseTogether', resultKey: 'resultEyeDistanceClose'),
        ],
      ),
      Question(
        id: 'nose',
        section: Section.middle,
        questionKey: 'questionNose',
        options: const [
          Option(key: 'straight', labelKey: 'optionStraightNose', resultKey: 'resultNoseStraight'),
          Option(key: 'convex', labelKey: 'optionConvex', resultKey: 'resultNoseConvex'),
          Option(key: 'long', labelKey: 'optionLongNose', resultKey: 'resultNoseLong'),
          Option(key: 'short', labelKey: 'optionShortNose', resultKey: 'resultNoseShort'),
          Option(key: 'wide', labelKey: 'optionWideNose', resultKey: 'resultNoseWide'),
          Option(key: 'narrow', labelKey: 'optionNarrowNose', resultKey: 'resultNoseNarrow'),
          Option(key: 'drooping_tip', labelKey: 'optionDroopingTip', resultKey: 'resultNoseDroopingTip'),
          Option(key: 'upturned_tip', labelKey: 'optionUpturnedTip', resultKey: 'resultNoseUpturnedTip'),
        ],
      ),
      Question(
        id: 'ear_size',
        section: Section.middle,
        questionKey: 'questionEarSize',
        options: const [
          Option(key: 'small', labelKey: 'optionSmall', resultKey: 'resultEarSizeSmall'),
          Option(key: 'medium', labelKey: 'optionMedium', resultKey: 'resultEarSizeMedium'),
          Option(key: 'large', labelKey: 'optionLarge', resultKey: 'resultEarSizeLarge'),
        ],
      ),
      Question(
        id: 'ear_position',
        section: Section.middle,
        questionKey: 'questionEarPosition',
        options: const [
          Option(key: 'low', labelKey: 'optionLow', resultKey: 'resultEarPositionLow'),
          Option(key: 'medium', labelKey: 'optionMedium', resultKey: 'resultEarPositionMedium'),
          Option(key: 'high', labelKey: 'optionHigh', resultKey: 'resultEarPositionHigh'),
        ],
      ),
      Question(
        id: 'earlobe',
        section: Section.middle,
        questionKey: 'questionEarlobe',
        options: const [
          Option(key: 'small', labelKey: 'optionSmall', resultKey: 'resultEarlobeSmall'),
          Option(key: 'large', labelKey: 'optionLarge', resultKey: 'resultEarlobeLarge'),
          Option(key: 'detached', labelKey: 'optionDetached', resultKey: 'resultEarlobeDetached'),
          Option(key: 'attached', labelKey: 'optionAttached', resultKey: 'resultEarlobeAttached'),
        ],
      ),
    ];
  }
  
  Question get currentQuestion => questions[currentIndex];
  
  bool get canGoNext => currentQuestion.isAnswered && currentIndex < questions.length - 1;
  bool get canGoPrevious => currentIndex > 0;
  bool get isLastQuestion => currentIndex == questions.length - 1;
  bool get isComplete => questions.every((q) => q.isAnswered);
  int get totalQuestions => questions.length;
  int get answeredCount => questions.where((q) => q.isAnswered).length;
  
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
