// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'PhysioScope';

  @override
  String get appDescription => 'Personality analysis through facial features';

  @override
  String get startAnalysis => 'Start Analysis';

  @override
  String get next => 'Next';

  @override
  String get previous => 'Previous';

  @override
  String get finish => 'Finish';

  @override
  String get conclusion => 'Conclusion';

  @override
  String get welcomeTitle => 'Welcome to PhysioScope';

  @override
  String get welcomeSubtitle =>
      'Discover your personality through facial feature analysis';

  @override
  String get startButton => 'Start Analysis';

  @override
  String get sectionUpper => 'Upper Section - Mind & Cognition';

  @override
  String get sectionMiddle => 'Middle Section - Emotion & Interaction';

  @override
  String get sectionLower => 'Lower Section - Behavior & Execution';

  @override
  String get questionUpperLength => 'What is the length of your upper face?';

  @override
  String get questionForeheadWidth => 'What is the width of your forehead?';

  @override
  String get questionHairlineShape => 'What is your hairline shape?';

  @override
  String get optionLong => 'Long';

  @override
  String get optionMedium => 'Medium';

  @override
  String get optionShort => 'Short';

  @override
  String get optionWide => 'Wide';

  @override
  String get optionNarrow => 'Narrow';

  @override
  String get optionStraight => 'Straight';

  @override
  String get optionCurved => 'Curved';

  @override
  String get optionWidowsPeak => 'Widow\'s Peak (M-shape)';

  @override
  String get resultUpperLong =>
      'You are a strategic thinker, inclined towards long-term planning and deep analysis before making decisions.';

  @override
  String get resultUpperMedium =>
      'You are balanced in your thinking, effectively combining strategic analysis with practical action.';

  @override
  String get resultUpperShort =>
      'You are a practical person, preferring direct execution and focusing on the present and tangible results.';

  @override
  String get resultForeheadWide =>
      'You have broad mental capacity and rich imagination, easily seeing the big picture.';

  @override
  String get resultForeheadMedium =>
      'You have a balance between analytical thinking and imagination, handling information in a balanced way.';

  @override
  String get resultForeheadNarrow =>
      'You focus on fine details, characterized by precision and attention to important particulars.';

  @override
  String get resultHairlineStraight =>
      'Your thinking is organized and systematic, you prefer clear structure and defined plans.';

  @override
  String get resultHairlineCurved =>
      'Your thinking is flexible and adaptable, you can handle changing situations easily.';

  @override
  String get resultHairlineWidowsPeak =>
      'You have great creativity and unconventional thinking, finding innovative solutions to problems.';

  @override
  String get question => 'Question';

  @override
  String get labelOf => 'of';

  @override
  String get analysisResult => 'Analysis Result';

  @override
  String get conclusionComingSoon =>
      'Conclusion feature coming soon. Complete all sections for comprehensive analysis.';
}
