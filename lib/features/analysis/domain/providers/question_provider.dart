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
  
  void debugLoadError(dynamic e) {}
  void debugSaveError(dynamic e) {}
  void debugResetError(dynamic e) {}
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
      // Middle Section - 13 questions (split eyebrows, eyes, nose)
      // Eyebrows - 3 questions
      Question(
        id: 'eyebrows_thickness',
        section: Section.middle,
        questionKey: 'questionEyebrowsThickness',
        options: const [
          Option(key: 'thin', labelKey: 'optionThin', resultKey: 'resultEyebrowsThin'),
          Option(key: 'thick', labelKey: 'optionThick', resultKey: 'resultEyebrowsThick'),
        ],
      ),
      Question(
        id: 'eyebrows_position',
        section: Section.middle,
        questionKey: 'questionEyebrowsPosition',
        options: const [
          Option(key: 'connected', labelKey: 'optionConnected', resultKey: 'resultEyebrowsConnected'),
          Option(key: 'partially_connected', labelKey: 'optionPartiallyConnected', resultKey: 'resultEyebrowsPartiallyConnected'),
          Option(key: 'separated', labelKey: 'optionSeparated', resultKey: 'resultEyebrowsSeparated'),
        ],
      ),
      Question(
        id: 'eyebrows_shape',
        section: Section.middle,
        questionKey: 'questionEyebrowsShape',
        options: const [
          Option(key: 'straight', labelKey: 'optionStraight', resultKey: 'resultEyebrowsStraight'),
          Option(key: 'arched', labelKey: 'optionArched', resultKey: 'resultEyebrowsArched'),
          Option(key: 'mountain', labelKey: 'optionMountain', resultKey: 'resultEyebrowsMountain'),
        ],
      ),
      // Eyes - 3 questions
      Question(
        id: 'eye_size',
        section: Section.middle,
        questionKey: 'questionEyeSize',
        options: const [
          Option(key: 'large', labelKey: 'optionLarge', resultKey: 'resultEyeSizeLarge'),
          Option(key: 'medium', labelKey: 'optionMedium', resultKey: 'resultEyeSizeMedium'),
          Option(key: 'small', labelKey: 'optionSmall', resultKey: 'resultEyeSizeSmall'),
        ],
      ),
      Question(
        id: 'eye_shape',
        section: Section.middle,
        questionKey: 'questionEyeShape',
        options: const [
          Option(key: 'protruding', labelKey: 'optionProtruding', resultKey: 'resultEyeShapeProtruding'),
          Option(key: 'deep_set', labelKey: 'optionDeepSet', resultKey: 'resultEyeShapeDeepSet'),
          Option(key: 'almond', labelKey: 'optionAlmond', resultKey: 'resultEyeShapeAlmond'),
          Option(key: 'round', labelKey: 'optionRound', resultKey: 'resultEyeShapeRound'),
        ],
      ),
      Question(
        id: 'eye_positioning',
        section: Section.middle,
        questionKey: 'questionEyePositioning',
        options: const [
          Option(key: 'wide_apart', labelKey: 'optionWideApart', resultKey: 'resultEyePositioningWideApart'),
          Option(key: 'medium', labelKey: 'optionMedium', resultKey: 'resultEyePositioningMedium'),
          Option(key: 'close_together', labelKey: 'optionCloseTogether', resultKey: 'resultEyePositioningCloseTogether'),
        ],
      ),
      // Nose - 4 questions
      Question(
        id: 'nose_straightness',
        section: Section.middle,
        questionKey: 'questionNoseStraightness',
        options: const [
          Option(key: 'roman', labelKey: 'optionRoman', resultKey: 'resultNoseStraightnessRoman'),
          Option(key: 'greek', labelKey: 'optionGreek', resultKey: 'resultNoseStraightnessGreek'),
          Option(key: 'aquiline', labelKey: 'optionAquiline', resultKey: 'resultNoseStraightnessAquiline'),
          Option(key: 'flat', labelKey: 'optionFlat', resultKey: 'resultNoseStraightnessFlat'),
          Option(key: 'snub', labelKey: 'optionSnub', resultKey: 'resultNoseStraightnessSnub'),
        ],
      ),
      Question(
        id: 'nose_length',
        section: Section.middle,
        questionKey: 'questionNoseLength',
        options: const [
          Option(key: 'long', labelKey: 'optionLong', resultKey: 'resultNoseLengthLong'),
          Option(key: 'medium', labelKey: 'optionMedium', resultKey: 'resultNoseLengthMedium'),
          Option(key: 'short', labelKey: 'optionShort', resultKey: 'resultNoseLengthShort'),
        ],
      ),
      Question(
        id: 'nose_width',
        section: Section.middle,
        questionKey: 'questionNoseWidth',
        options: const [
          Option(key: 'wide', labelKey: 'optionWide', resultKey: 'resultNoseWidthWide'),
          Option(key: 'medium', labelKey: 'optionMedium', resultKey: 'resultNoseWidthMedium'),
          Option(key: 'narrow', labelKey: 'optionNarrow', resultKey: 'resultNoseWidthNarrow'),
        ],
      ),
      Question(
        id: 'nose_tip_shape',
        section: Section.middle,
        questionKey: 'questionNoseTipShape',
        options: const [
          Option(key: 'fleshy', labelKey: 'optionFleshy', resultKey: 'resultNoseTipShapeFleshy'),
          Option(key: 'refined', labelKey: 'optionRefined', resultKey: 'resultNoseTipShapeRefined'),
          Option(key: 'bulbous', labelKey: 'optionBulbous', resultKey: 'resultNoseTipShapeBulbous'),
          Option(key: 'pointed', labelKey: 'optionPointed', resultKey: 'resultNoseTipShapePointed'),
          Option(key: 'drooping', labelKey: 'optionDroopingTip', resultKey: 'resultNoseTipShapeDrooping'),
          Option(key: 'upturned', labelKey: 'optionUpturnedTip', resultKey: 'resultNoseTipShapeUpturned'),
        ],
      ),
      // Ear questions - 3 questions
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
