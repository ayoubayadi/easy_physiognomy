import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/providers/question_provider.dart';

class ResultDisplay extends ConsumerWidget {
  const ResultDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(questionProvider);
    final question = state.currentQuestion;
    final selectedOption = question.selectedOption;
    final l10n = AppLocalizations.of(context);
    
    if (selectedOption == null) {
      return const SizedBox.shrink();
    }
    
    final resultText = _getResultText(l10n, selectedOption.resultKey);
    
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOutCubic,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.1),
            Theme.of(context).colorScheme.secondary.withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.08),
            blurRadius: 12,
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
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.auto_awesome_outlined,
                  color: Theme.of(context).colorScheme.primary,
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                l10n.analysisResult,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            resultText,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              height: 1.6,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
  
  String _getResultText(AppLocalizations l10n, String key) {
    switch (key) {
      // Upper Section
      case 'resultUpperLong': return l10n.resultUpperLong;
      case 'resultUpperMedium': return l10n.resultUpperMedium;
      case 'resultUpperShort': return l10n.resultUpperShort;
      case 'resultForeheadWide': return l10n.resultForeheadWide;
      case 'resultForeheadMedium': return l10n.resultForeheadMedium;
      case 'resultForeheadNarrow': return l10n.resultForeheadNarrow;
      case 'resultHairlineStraight': return l10n.resultHairlineStraight;
      case 'resultHairlineCurved': return l10n.resultHairlineCurved;
      case 'resultHairlineWidowsPeak': return l10n.resultHairlineWidowsPeak;
      // Eyebrows
      case 'resultEyebrowsThin': return l10n.resultEyebrowsThin;
      case 'resultEyebrowsThick': return l10n.resultEyebrowsThick;
      case 'resultEyebrowsConnected': return l10n.resultEyebrowsConnected;
      case 'resultEyebrowsPartiallyConnected': return l10n.resultEyebrowsPartiallyConnected;
      case 'resultEyebrowsSeparated': return l10n.resultEyebrowsSeparated;
      case 'resultEyebrowsStraight': return l10n.resultEyebrowsStraight;
      case 'resultEyebrowsArched': return l10n.resultEyebrowsArched;
      case 'resultEyebrowsMountain': return l10n.resultEyebrowsMountain;
      // Eyes
      case 'resultEyeSizeLarge': return l10n.resultEyeSizeLarge;
      case 'resultEyeSizeSmall': return l10n.resultEyeSizeSmall;
      case 'resultEyeSizeMedium': return l10n.resultEyeSizeMedium;
      case 'resultEyeShapeProtruding': return l10n.resultEyeShapeProtruding;
      case 'resultEyeShapeDeepSet': return l10n.resultEyeShapeDeepSet;
      case 'resultEyeShapeAlmond': return l10n.resultEyeShapeAlmond;
      case 'resultEyeShapeRound': return l10n.resultEyeShapeRound;
      case 'resultEyePositioningWideApart': return l10n.resultEyePositioningWideApart;
      case 'resultEyePositioningCloseTogether': return l10n.resultEyePositioningCloseTogether;
      case 'resultEyePositioningMedium': return l10n.resultEyePositioningMedium;
      // Nose
      case 'resultNoseStraightnessRoman': return l10n.resultNoseStraightnessRoman;
      case 'resultNoseStraightnessGreek': return l10n.resultNoseStraightnessGreek;
      case 'resultNoseStraightnessAquiline': return l10n.resultNoseStraightnessAquiline;
      case 'resultNoseStraightnessFlat': return l10n.resultNoseStraightnessFlat;
      case 'resultNoseStraightnessSnub': return l10n.resultNoseStraightnessSnub;
      case 'resultNoseLengthLong': return l10n.resultNoseLengthLong;
      case 'resultNoseLengthVeryLong': return l10n.resultNoseLengthVeryLong;
      case 'resultNoseLengthShort': return l10n.resultNoseLengthShort;
      case 'resultNoseLengthMedium': return l10n.resultNoseLengthMedium;
      case 'resultNoseWidthWide': return l10n.resultNoseWidthWide;
      case 'resultNoseWidthNarrow': return l10n.resultNoseWidthNarrow;
      case 'resultNoseWidthMedium': return l10n.resultNoseWidthMedium;
      case 'resultNoseTipShapeFleshy': return l10n.resultNoseTipShapeFleshy;
      case 'resultNoseTipShapeRefined': return l10n.resultNoseTipShapeRefined;
      case 'resultNoseTipShapeBulbous': return l10n.resultNoseTipShapeBulbous;
      case 'resultNoseTipShapePointed': return l10n.resultNoseTipShapePointed;
      case 'resultNoseTipShapeDrooping': return l10n.resultNoseTipShapeDrooping;
      case 'resultNoseTipShapeUpturned': return l10n.resultNoseTipShapeUpturned;
      // Ears
      case 'resultEarSizeSmall': return l10n.resultEarSizeSmall;
      case 'resultEarSizeMedium': return l10n.resultEarSizeMedium;
      case 'resultEarSizeLarge': return l10n.resultEarSizeLarge;
      case 'resultEarPositionLow': return l10n.resultEarPositionLow;
      case 'resultEarPositionMedium': return l10n.resultEarPositionMedium;
      case 'resultEarPositionHigh': return l10n.resultEarPositionHigh;
      case 'resultEarlobeSmall': return l10n.resultEarlobeSmall;
      case 'resultEarlobeLarge': return l10n.resultEarlobeLarge;
      case 'resultEarlobeDetached': return l10n.resultEarlobeDetached;
      case 'resultEarlobeAttached': return l10n.resultEarlobeAttached;
      default: return '';
    }
  }
}
