import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/providers/locale_provider.dart';
import '../../domain/models/question.dart';
import '../../domain/providers/question_provider.dart';

class ConclusionScreen extends ConsumerWidget {
  const ConclusionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(questionProvider);
    final l10n = AppLocalizations.of(context);
    final locale = ref.watch(localeProvider);
    
    // Save to history if complete
    if (state.isComplete) {
      ref.read(questionProvider.notifier).saveToHistory(ref);
    }
    
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
                        Row(
                          children: [
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
                      if (analysis.overallPersonality.isNotEmpty)
                        _buildPersonalityCard(context, analysis),
                      if (analysis.overallPersonality.isNotEmpty && analysis.upperSection.isNotEmpty)
                        const SizedBox(height: 16),
                      if (analysis.upperSection.isNotEmpty)
                        _buildSectionCard(
                          context,
                          icon: Icons.psychology_outlined,
                          title: l10n.sectionUpper,
                          content: analysis.upperSection,
                        ),
                      if (analysis.middleSection.isNotEmpty)
                        const SizedBox(height: 16),
                      if (analysis.middleSection.isNotEmpty)
                        _buildSectionCard(
                          context,
                          icon: Icons.favorite_outline,
                          title: l10n.sectionMiddle,
                          content: analysis.middleSection,
                        ),
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
  
  Widget _buildPersonalityCard(BuildContext context, AnalysisResult analysis) {
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
              const Text(
                'Your Personality Profile',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
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
    
    // Personality traits counters
    int strategic = 0, practical = 0, creative = 0;
    int emotional = 0, analytical = 0, social = 0;
    int leader = 0, follower = 0, independent = 0;
    
    for (final question in state.questions) {
      if (!question.isAnswered) continue;
      
      final selectedOption = question.selectedOption!;
      final resultText = _getResultForOption(l10n, question.id, selectedOption.key);
      
      // Count personality traits based on answers
      final traits = _getTraitsForAnswer(question.id, selectedOption.key);
      strategic += traits['strategic'] ?? 0;
      practical += traits['practical'] ?? 0;
      creative += traits['creative'] ?? 0;
      emotional += traits['emotional'] ?? 0;
      analytical += traits['analytical'] ?? 0;
      social += traits['social'] ?? 0;
      leader += traits['leader'] ?? 0;
      independent += traits['independent'] ?? 0;
      
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
    
    // Generate overall personality based on trait counts
    final overallPersonality = _generatePersonalityText(
      strategic, practical, creative,
      emotional, analytical, social,
      leader, independent, l10n,
    );
    
    return AnalysisResult(
      overallPersonality: overallPersonality,
      upperSection: upperResults.join(' '),
      middleSection: middleResults.join(' '),
      lowerSection: lowerResults.join(' '),
    );
  }
  
  Map<String, int> _getTraitsForAnswer(String questionId, String optionKey) {
    // Simplified trait mapping based on physiognomy principles
    final traits = <String, int>{};
    
    // Upper face (mind) traits
    if (questionId == 'upper_length') {
      if (optionKey == 'long') traits['strategic'] = 2;
      if (optionKey == 'short') traits['practical'] = 2;
    }
    if (questionId == 'forehead_width') {
      if (optionKey == 'wide') traits['creative'] = 2;
      if (optionKey == 'narrow') traits['analytical'] = 2;
    }
    
    // Middle face (emotion) traits
    if (questionId.startsWith('eyebrows') || questionId.startsWith('eye_')) {
      traits['emotional'] = 1;
      if (optionKey.contains('wide') || optionKey.contains('large')) traits['social'] = 1;
    }
    if (questionId.startsWith('nose_')) {
      if (optionKey.contains('roman') || optionKey.contains('wide') || optionKey.contains('long')) {
        traits['leader'] = 2;
      }
    }
    
    // Lower face (behavior) traits
    if (questionId == 'jaw') {
      if (optionKey == 'wide' || optionKey == 'angular') traits['leader'] = 2;
    }
    if (questionId == 'chin') {
      if (optionKey == 'prominent') traits['independent'] = 2;
      if (optionKey == 'receding') traits['social'] = 1;
    }
    
    return traits;
  }
  
  String _generatePersonalityText(
    int strategic, int practical, int creative,
    int emotional, int analytical, int social,
    int leader, int independent, AppLocalizations l10n,
  ) {
    final parts = <String>[];
    
    // Determine dominant thinking style
    if (strategic >= practical && strategic >= creative) {
      parts.add('You are primarily a strategic thinker who plans ahead and analyzes situations deeply.');
    } else if (practical >= strategic && practical >= creative) {
      parts.add('You are a practical person who focuses on getting things done efficiently.');
    } else {
      parts.add('You are a creative individual who thinks outside the box and finds innovative solutions.');
    }
    
    // Determine emotional style
    if (emotional > analytical) {
      parts.add('You lead with your heart and are highly attuned to the emotions of others.');
    } else {
      parts.add('You approach life analytically, preferring logic over emotion in decision-making.');
    }
    
    // Determine social style
    if (social > 3) {
      parts.add('You are naturally social and thrive in group settings.');
    } else if (independent > 3) {
      parts.add('You value your independence and prefer working autonomously.');
    }
    
    // Determine leadership tendency
    if (leader > 4) {
      parts.add('You have strong leadership qualities and naturally take charge in situations.');
    }
    
    return parts.join(' ');
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
  final String upperSection;
  final String middleSection;
  final String lowerSection;
  
  AnalysisResult({
    required this.overallPersonality,
    required this.upperSection,
    required this.middleSection,
    required this.lowerSection,
  });
}
