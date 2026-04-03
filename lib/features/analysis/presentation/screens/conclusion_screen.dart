import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/models/question.dart';
import '../../domain/providers/question_provider.dart';

class ConclusionScreen extends ConsumerWidget {
  const ConclusionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(questionProvider);
    final l10n = AppLocalizations.of(context);
    
    // Generate comprehensive analysis
    final analysis = _generateAnalysis(state, l10n);
    
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF9FA8DA).withOpacity(0.2),
                const Color(0xFFF8BBD0).withOpacity(0.15),
                const Color(0xFFB2DFDB).withOpacity(0.2),
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
                      color: const Color(0xFF9FA8DA).withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.auto_awesome,
                        size: 40,
                        color: Colors.white,
                      ),
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
                        color: Colors.white.withOpacity(0.9),
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
                      // Upper Section Analysis
                      if (analysis.upperSection.isNotEmpty)
                        _buildSectionCard(
                          context,
                          icon: Icons.psychology_outlined,
                          title: l10n.sectionUpper,
                          content: analysis.upperSection,
                        ),
                      const SizedBox(height: 16),
                      // Middle Section Analysis
                      if (analysis.middleSection.isNotEmpty)
                        _buildSectionCard(
                          context,
                          icon: Icons.favorite_outline,
                          title: l10n.sectionMiddle,
                          content: analysis.middleSection,
                        ),
                      const SizedBox(height: 16),
                      // Lower Section Analysis
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
                              color: const Color(0xFF9FA8DA).withOpacity(0.4),
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
            color: const Color(0xFF9FA8DA).withOpacity(0.15),
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
                  color: const Color(0xFF9FA8DA).withOpacity(0.15),
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
    
    for (final question in state.questions) {
      if (!question.isAnswered) continue;
      
      final selectedOption = question.selectedOption!;
      final resultText = _getResultForOption(l10n, question.id, selectedOption.key);
      
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
    
    return AnalysisResult(
      upperSection: upperResults.join(' '),
      middleSection: middleResults.join(' '),
      lowerSection: lowerResults.join(' '),
    );
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
  final String upperSection;
  final String middleSection;
  final String lowerSection;
  
  AnalysisResult({
    required this.upperSection,
    required this.middleSection,
    required this.lowerSection,
  });
}
