import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/providers/locale_provider.dart';
import '../../domain/models/question.dart';
import '../../domain/models/analysis_history.dart';
import '../../domain/providers/question_provider.dart';
import '../../domain/providers/history_provider.dart';

class ConclusionScreen extends ConsumerStatefulWidget {
  const ConclusionScreen({super.key});

  @override
  ConsumerState<ConclusionScreen> createState() => _ConclusionScreenState();
}

class _ConclusionScreenState extends ConsumerState<ConclusionScreen> {
  bool _hasSaved = false;
  
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(questionProvider);
    final l10n = AppLocalizations.of(context);
    final locale = ref.watch(localeProvider);
    
    // Generate comprehensive analysis
    final analysis = _generateAnalysis(state, l10n);
    
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF9FA8DA).withValues(alpha: 0.2),
                const Color(0xFFF8BBD0).withValues(alpha: 0.15),
                const Color(0xFFB2DFDB).withValues(alpha: 0.2),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              // Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF9FA8DA),
                      Color(0xFFB2DFDB),
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF9FA8DA).withValues(alpha: 0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.auto_awesome,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                // Save button
                                if (!_hasSaved && state.isComplete)
                                  _buildHeaderButton(
                                    icon: Icons.save,
                                    label: l10n.saveAnalysis,
                                    onTap: () => _saveAnalysis(ref, l10n),
                                  ),
                                if (!_hasSaved && state.isComplete)
                                  const SizedBox(width: 8),
                                // History button
                                _buildHeaderButton(
                                  icon: Icons.history,
                                  label: l10n.history,
                                  onTap: () => Navigator.pushNamed(context, '/history'),
                                ),
                                const SizedBox(width: 8),
                                // Language switch button
                                _buildHeaderButton(
                                  icon: Icons.language,
                                  label: locale.languageCode.toUpperCase(),
                                  onTap: () {
                                    final notifier = ref.read(localeProvider.notifier);
                                    final newLocale = notifier.isArabic 
                                        ? const Locale('en') 
                                        : const Locale('ar');
                                    notifier.setLocale(newLocale);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      l10n.conclusion,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${state.answeredCount} ${l10n.labelOf} ${state.totalQuestions}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withValues(alpha: 0.9),
                      ),
                    ),
                  ],
                ),
              ),
              // Analysis Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Personality Profile Card
                      _buildPersonalityCard(context, analysis, l10n),
                      const SizedBox(height: 16),
                      // Upper Section
                      if (analysis.upperSection.isNotEmpty)
                        _buildSectionCard(
                          context,
                          icon: Icons.psychology_outlined,
                          title: l10n.sectionUpper,
                          content: analysis.upperSection,
                        ),
                      // Middle Section
                      if (analysis.middleSection.isNotEmpty)
                        const SizedBox(height: 16),
                      if (analysis.middleSection.isNotEmpty)
                        _buildSectionCard(
                          context,
                          icon: Icons.favorite_outline,
                          title: l10n.sectionMiddle,
                          content: analysis.middleSection,
                        ),
                      // Lower Section
                      if (analysis.lowerSection.isNotEmpty)
                        const SizedBox(height: 16),
                      if (analysis.lowerSection.isNotEmpty)
                        _buildSectionCard(
                          context,
                          icon: Icons.directions_walk_outlined,
                          title: l10n.sectionLower,
                          content: analysis.lowerSection,
                        ),
                      const SizedBox(height: 24),
                      // Restart Button
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF9FA8DA),
                              Color(0xFFB2DFDB),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF9FA8DA).withValues(alpha: 0.4),
                              blurRadius: 15,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            ref.read(questionProvider.notifier).reset();
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/welcome',
                              (route) => false,
                            );
                          },
                          icon: const Icon(Icons.refresh),
                          label: Text(
                            l10n.startAnalysis,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shadowColor: Colors.transparent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Future<void> _saveAnalysis(WidgetRef ref, AppLocalizations l10n) async {
    final state = ref.read(questionProvider);
    if (!state.isComplete) return;
    
    final answers = <String, int>{};
    for (final q in state.questions) {
      if (q.selectedOptionIndex != null) {
        answers[q.id] = q.selectedOptionIndex!;
      }
    }
    
    // Generate the analysis text
    final analysis = _generateAnalysis(state, l10n);
    
    final historyEntry = AnalysisHistory(
      id: '${DateTime.now().millisecondsSinceEpoch}',
      timestamp: DateTime.now(),
      answers: answers,
      language: ref.read(localeProvider).languageCode,
      totalQuestions: state.totalQuestions,
      answeredCount: state.answeredCount,
      topTraits: analysis.topTraits,
      personalityText: analysis.overallPersonality,
      upperSectionText: analysis.upperSection,
      middleSectionText: analysis.middleSection,
      lowerSectionText: analysis.lowerSection,
    );
    
    await ref.read(historyProvider.notifier).saveAnalysis(historyEntry);
    
    setState(() {
      _hasSaved = true;
    });
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.savedSuccessfully),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
  
  Widget _buildHeaderButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 18, color: Colors.white),
                const SizedBox(width: 4),
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildPersonalityCard(BuildContext context, AnalysisResult analysis, AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF9FA8DA),
            Color(0xFFB2DFDB),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF9FA8DA).withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.25),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.auto_awesome,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: 14),
              Text(
                l10n.personalityProfile,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Trait badges
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: analysis.topTraits.map((trait) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.25),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  trait,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          Text(
            analysis.overallPersonality,
            style: const TextStyle(
              fontSize: 16,
              height: 1.8,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildSectionCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF9FA8DA).withValues(alpha: 0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF9FA8DA).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: const Color(0xFF9FA8DA),
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5C5C7C),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            content,
            style: const TextStyle(
              fontSize: 15,
              height: 1.7,
              color: Color(0xFF5C5C7C),
            ),
          ),
        ],
      ),
    );
  }
  
  AnalysisResult _generateAnalysis(QuestionState state, AppLocalizations l10n) {
    final upperResults = <String>[];
    final middleResults = <String>[];
    final lowerResults = <String>[];
    
    // Count actual answers
    int totalAnswers = 0;
    Map<String, int> traitCounts = {
      'strategic': 0,
      'practical': 0,
      'creative': 0,
      'emotional': 0,
      'analytical': 0,
      'social': 0,
      'leader': 0,
      'independent': 0,
    };
    
    for (final question in state.questions) {
      if (!question.isAnswered) continue;
      totalAnswers++;
      
      final selectedOption = question.selectedOption!;
      final resultText = _getResultForOption(l10n, question.id, selectedOption.key);
      
      // Count traits based on actual answers
      final traits = _getTraitsForAnswer(question.id, selectedOption.key);
      for (final entry in traits.entries) {
        traitCounts[entry.key] = (traitCounts[entry.key] ?? 0) + entry.value;
      }
      
      switch (question.section) {
        case Section.upper:
          upperResults.add(resultText);
          break;
        case Section.middle:
          middleResults.add(resultText);
          break;
        case Section.lower:
          lowerResults.add(resultText);
          break;
      }
    }
    
    // Generate dynamic personality based on actual trait counts
    final personalityParts = <String>[];
    
    // Thinking style
    if (traitCounts['strategic']! > traitCounts['practical']! && traitCounts['strategic']! > traitCounts['creative']!) {
      personalityParts.add(l10n.thinkingStyle == 'Thinking Style' 
          ? 'You are a strategic thinker who plans ahead and analyzes situations deeply before making decisions.'
          : 'أنت مفكر استراتيجي تخطط مسبقاً وتحلل المواقف بعمق قبل اتخاذ القرارات.');
    } else if (traitCounts['practical']! >= traitCounts['strategic']! && traitCounts['practical']! > traitCounts['creative']!) {
      personalityParts.add(l10n.thinkingStyle == 'Thinking Style'
          ? 'You are practical and action-oriented, preferring to get things done efficiently.'
          : 'أنت شخص عملي وتوجه نحو العمل، تفضل إنجاز الأمور بكفاءة.');
    } else {
      personalityParts.add(l10n.thinkingStyle == 'Thinking Style'
          ? 'You are creative and innovative, finding unique solutions to problems.'
          : 'أنت شخص مبدع ومبتكر، تجد حلولاً فريدة للمشاكل.');
    }
    
    // Emotional style
    if (traitCounts['emotional']! > traitCounts['analytical']!) {
      personalityParts.add(l10n.emotionalStyle == 'Emotional Style'
          ? 'You lead with your heart and are highly attuned to emotions.'
          : 'أنت تقود بقلبك ومتناغم جداً مع المشاعر.');
    } else {
      personalityParts.add(l10n.emotionalStyle == 'Emotional Style'
          ? 'You approach life analytically, preferring logic in decision-making.'
          : 'أنت تقارب الحياة بتحليلي، مفضلاً المنطق في اتخاذ القرارات.');
    }
    
    // Social style
    if (traitCounts['social']! > traitCounts['independent']!) {
      personalityParts.add(l10n.socialStyle == 'Social Style'
          ? 'You are naturally social and thrive in group settings.'
          : 'أنت اجتماعي بطبيعتك وتزدهر في المجموعات.');
    } else {
      personalityParts.add(l10n.socialStyle == 'Social Style'
          ? 'You value independence and prefer working autonomously.'
          : 'أنت تقدر الاستقلالية وتفضل العمل بشكل مستقل.');
    }
    
    // Leadership
    if (traitCounts['leader']! >= 4) {
      personalityParts.add(l10n.leadershipTrait == 'Leadership'
          ? 'You have strong leadership qualities and naturally take charge.'
          : 'لديك صفات قيادية قوية وتتولى المسؤولية بشكل طبيعي.');
    }
    
    // Get top 3 traits for badges
    final sortedTraits = traitCounts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    final topTraits = sortedTraits.take(3).map((e) {
      switch (e.key) {
        case 'strategic': return l10n.thinkingStyle == 'Thinking Style' ? 'Strategic' : 'استراتيجي';
        case 'practical': return l10n.thinkingStyle == 'Thinking Style' ? 'Practical' : 'عملي';
        case 'creative': return l10n.thinkingStyle == 'Thinking Style' ? 'Creative' : 'مبدع';
        case 'emotional': return l10n.emotionalStyle == 'Emotional Style' ? 'Emotional' : 'عاطفي';
        case 'analytical': return l10n.thinkingStyle == 'Thinking Style' ? 'Analytical' : 'تحليلي';
        case 'social': return l10n.socialStyle == 'Social Style' ? 'Social' : 'اجتماعي';
        case 'leader': return l10n.leadershipTrait == 'Leadership' ? 'Leader' : 'قائد';
        case 'independent': return l10n.socialStyle == 'Social Style' ? 'Independent' : 'مستقل';
        default: return e.key;
      }
    }).toList();
    
    return AnalysisResult(
      overallPersonality: personalityParts.join(' '),
      topTraits: topTraits,
      upperSection: upperResults.join(' '),
      middleSection: middleResults.join(' '),
      lowerSection: lowerResults.join(' '),
    );
  }
  
  Map<String, int> _getTraitsForAnswer(String questionId, String optionKey) {
    final traits = <String, int>{};
    
    // Upper face (mind) traits
    if (questionId == 'upper_length') {
      if (optionKey == 'long') traits['strategic'] = 2;
      if (optionKey == 'medium') traits['analytical'] = 1;
      if (optionKey == 'short') traits['practical'] = 2;
    }
    if (questionId == 'forehead_width') {
      if (optionKey == 'wide') traits['creative'] = 2;
      if (optionKey == 'narrow') traits['analytical'] = 2;
    }
    if (questionId == 'hairline_shape') {
      if (optionKey == 'straight') traits['analytical'] = 1;
      if (optionKey == 'curved') traits['practical'] = 1;
      if (optionKey == 'widows_peak') traits['creative'] = 2;
    }
    
    // Middle face (emotion) traits
    if (questionId.startsWith('eyebrows')) {
      traits['emotional'] = 1;
      if (optionKey == 'mountain' || optionKey == 'thick') traits['leader'] = 1;
    }
    if (questionId.startsWith('eye_')) {
      traits['emotional'] = 1;
      if (optionKey.contains('wide') || optionKey.contains('large') || optionKey == 'eye_shape_almond') traits['social'] = 1;
    }
    if (questionId.startsWith('nose_')) {
      if (optionKey.contains('roman') || optionKey.contains('wide') || optionKey.contains('long')) {
        traits['leader'] = 2;
      }
      if (optionKey.contains('straight') || optionKey.contains('greek')) traits['creative'] = 1;
    }
    if (questionId.startsWith('ear')) {
      traits['analytical'] = 1;
    }
    
    // Lower face (behavior) traits
    if (questionId == 'mouth_width') {
      if (optionKey == 'wide') traits['social'] = 2;
      if (optionKey == 'narrow') traits['independent'] = 1;
    }
    if (questionId == 'lips') {
      traits['emotional'] = 1;
      if (optionKey == 'full') traits['social'] = 1;
    }
    if (questionId == 'jaw') {
      if (optionKey == 'wide' || optionKey == 'angular') traits['leader'] = 2;
    }
    if (questionId == 'chin') {
      if (optionKey == 'prominent') traits['independent'] = 2;
      if (optionKey == 'receding') traits['social'] = 1;
    }
    
    return traits;
  }
  
  String _getResultForOption(AppLocalizations l10n, String questionId, String optionKey) {
    switch ('${questionId}_$optionKey') {
      // Upper Section
      case 'upper_length_long': return l10n.resultUpperLong;
      case 'upper_length_medium': return l10n.resultUpperMedium;
      case 'upper_length_short': return l10n.resultUpperShort;
      case 'forehead_width_wide': return l10n.resultForeheadWide;
      case 'forehead_width_medium': return l10n.resultForeheadMedium;
      case 'forehead_width_narrow': return l10n.resultForeheadNarrow;
      case 'hairline_shape_straight': return l10n.resultHairlineStraight;
      case 'hairline_shape_curved': return l10n.resultHairlineCurved;
      case 'hairline_shape_widows_peak': return l10n.resultHairlineWidowsPeak;
      // Middle Section - Eyebrows
      case 'eyebrows_thickness_thin': return l10n.resultEyebrowsThin;
      case 'eyebrows_thickness_thick': return l10n.resultEyebrowsThick;
      case 'eyebrows_position_connected': return l10n.resultEyebrowsConnected;
      case 'eyebrows_position_partially_connected': return l10n.resultEyebrowsPartiallyConnected;
      case 'eyebrows_position_separated': return l10n.resultEyebrowsSeparated;
      case 'eyebrows_shape_straight': return l10n.resultEyebrowsStraight;
      case 'eyebrows_shape_arched': return l10n.resultEyebrowsArched;
      case 'eyebrows_shape_mountain': return l10n.resultEyebrowsMountain;
      // Middle Section - Eyes
      case 'eye_size_large': return l10n.resultEyeSizeLarge;
      case 'eye_size_medium': return l10n.resultEyeSizeMedium;
      case 'eye_size_small': return l10n.resultEyeSizeSmall;
      case 'eye_shape_protruding': return l10n.resultEyeShapeProtruding;
      case 'eye_shape_deep_set': return l10n.resultEyeShapeDeepSet;
      case 'eye_shape_almond': return l10n.resultEyeShapeAlmond;
      case 'eye_shape_round': return l10n.resultEyeShapeRound;
      case 'eye_positioning_wide_apart': return l10n.resultEyePositioningWideApart;
      case 'eye_positioning_medium': return l10n.resultEyePositioningMedium;
      case 'eye_positioning_close_together': return l10n.resultEyePositioningCloseTogether;
      // Middle Section - Nose
      case 'nose_straightness_roman': return l10n.resultNoseStraightnessRoman;
      case 'nose_straightness_greek': return l10n.resultNoseStraightnessGreek;
      case 'nose_straightness_aquiline': return l10n.resultNoseStraightnessAquiline;
      case 'nose_straightness_flat': return l10n.resultNoseStraightnessFlat;
      case 'nose_straightness_snub': return l10n.resultNoseStraightnessSnub;
      case 'nose_length_long': return l10n.resultNoseLengthLong;
      case 'nose_length_medium': return l10n.resultNoseLengthMedium;
      case 'nose_length_short': return l10n.resultNoseLengthShort;
      case 'nose_width_wide': return l10n.resultNoseWidthWide;
      case 'nose_width_medium': return l10n.resultNoseWidthMedium;
      case 'nose_width_narrow': return l10n.resultNoseWidthNarrow;
      case 'nose_tip_shape_fleshy': return l10n.resultNoseTipShapeFleshy;
      case 'nose_tip_shape_refined': return l10n.resultNoseTipShapeRefined;
      case 'nose_tip_shape_bulbous': return l10n.resultNoseTipShapeBulbous;
      case 'nose_tip_shape_pointed': return l10n.resultNoseTipShapePointed;
      case 'nose_tip_shape_drooping': return l10n.resultNoseTipShapeDrooping;
      case 'nose_tip_shape_upturned': return l10n.resultNoseTipShapeUpturned;
      // Middle Section - Ears
      case 'ear_size_small': return l10n.resultEarSizeSmall;
      case 'ear_size_medium': return l10n.resultEarSizeMedium;
      case 'ear_size_large': return l10n.resultEarSizeLarge;
      case 'ear_position_low': return l10n.resultEarPositionLow;
      case 'ear_position_medium': return l10n.resultEarPositionMedium;
      case 'ear_position_high': return l10n.resultEarPositionHigh;
      case 'earlobe_small': return l10n.resultEarlobeSmall;
      case 'earlobe_large': return l10n.resultEarlobeLarge;
      case 'earlobe_detached': return l10n.resultEarlobeDetached;
      case 'earlobe_attached': return l10n.resultEarlobeAttached;
      // Lower Section
      case 'mouth_width_narrow': return l10n.resultMouthWidthNarrow;
      case 'mouth_width_medium': return l10n.resultMouthWidthMedium;
      case 'mouth_width_wide': return l10n.resultMouthWidthWide;
      case 'lips_thin': return l10n.resultLipsThin;
      case 'lips_medium': return l10n.resultLipsMedium;
      case 'lips_full': return l10n.resultLipsFull;
      case 'lips_asymmetrical': return l10n.resultLipsAsymmetrical;
      case 'jaw_narrow': return l10n.resultJawNarrow;
      case 'jaw_medium': return l10n.resultJawMedium;
      case 'jaw_wide': return l10n.resultJawWide;
      case 'jaw_angular': return l10n.resultJawAngular;
      case 'chin_pointed': return l10n.resultChinPointed;
      case 'chin_rounded': return l10n.resultChinRounded;
      case 'chin_receding': return l10n.resultChinReceding;
      case 'chin_prominent': return l10n.resultChinProminent;
      default: return '';
    }
  }
}

class AnalysisResult {
  final String overallPersonality;
  final List<String> topTraits;
  final String upperSection;
  final String middleSection;
  final String lowerSection;
  
  AnalysisResult({
    required this.overallPersonality,
    required this.topTraits,
    required this.upperSection,
    required this.middleSection,
    required this.lowerSection,
  });
}
