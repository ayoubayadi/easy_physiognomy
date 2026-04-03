import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/providers/question_provider.dart';

class QuestionCard extends ConsumerWidget {
  const QuestionCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(questionProvider);
    final question = state.currentQuestion;
    final l10n = AppLocalizations.of(context);
    
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                Icons.face_outlined,
                color: Theme.of(context).colorScheme.primary,
                size: 24,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _getQuestionText(l10n, question.questionKey),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 28),
            ...question.options.asMap().entries.map((entry) {
              final index = entry.key;
              final option = entry.value;
              final isSelected = question.selectedOptionIndex == index;
              
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: isSelected 
                      ? Theme.of(context).colorScheme.primary.withOpacity(0.12)
                      : Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.outline,
                    width: isSelected ? 2 : 1,
                  ),
                ),
                child: CheckboxListTile(
                  value: isSelected,
                  onChanged: (value) async {
                    await ref.read(questionProvider.notifier).selectOption(state.currentIndex, index);
                  },
                  title: Text(
                    _getOptionText(l10n, option.labelKey),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                  secondary: isSelected
                      ? Icon(
                          Icons.check_circle,
                          color: Theme.of(context).colorScheme.primary,
                          size: 22,
                        )
                      : null,
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Theme.of(context).colorScheme.primary,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  String _getQuestionText(AppLocalizations l10n, String key) {
    switch (key) {
      case 'questionUpperLength': return l10n.questionUpperLength;
      case 'questionForeheadWidth': return l10n.questionForeheadWidth;
      case 'questionHairlineShape': return l10n.questionHairlineShape;
      case 'questionEyebrowsThickness': return l10n.questionEyebrowsThickness;
      case 'questionEyebrowsPosition': return l10n.questionEyebrowsPosition;
      case 'questionEyebrowsShape': return l10n.questionEyebrowsShape;
      case 'questionEyeSize': return l10n.questionEyeSize;
      case 'questionEyeShape': return l10n.questionEyeShape;
      case 'questionEyePositioning': return l10n.questionEyePositioning;
      case 'questionNoseStraightness': return l10n.questionNoseStraightness;
      case 'questionNoseLength': return l10n.questionNoseLength;
      case 'questionNoseWidth': return l10n.questionNoseWidth;
      case 'questionNoseTipShape': return l10n.questionNoseTipShape;
      case 'questionEarSize': return l10n.questionEarSize;
      case 'questionEarPosition': return l10n.questionEarPosition;
      case 'questionEarlobe': return l10n.questionEarlobe;
      default: return '';
    }
  }

  String _getOptionText(AppLocalizations l10n, String key) {
    switch (key) {
      case 'optionLong': return l10n.optionLong;
      case 'optionMedium': return l10n.optionMedium;
      case 'optionShort': return l10n.optionShort;
      case 'optionWide': return l10n.optionWide;
      case 'optionNarrow': return l10n.optionNarrow;
      case 'optionStraight': return l10n.optionStraight;
      case 'optionCurved': return l10n.optionCurved;
      case 'optionWidowsPeak': return l10n.optionWidowsPeak;
      case 'optionThin': return l10n.optionThin;
      case 'optionThick': return l10n.optionThick;
      case 'optionConnected': return l10n.optionConnected;
      case 'optionPartiallyConnected': return l10n.optionPartiallyConnected;
      case 'optionSeparated': return l10n.optionSeparated;
      case 'optionArched': return l10n.optionArched;
      case 'optionMountain': return l10n.optionMountain;
      case 'optionProtruding': return l10n.optionProtruding;
      case 'optionSmall': return l10n.optionSmall;
      case 'optionLarge': return l10n.optionLarge;
      case 'optionDeepSet': return l10n.optionDeepSet;
      case 'optionRound': return l10n.optionRound;
      case 'optionAlmond': return l10n.optionAlmond;
      case 'optionWideApart': return l10n.optionWideApart;
      case 'optionCloseTogether': return l10n.optionCloseTogether;
      case 'optionRoman': return l10n.optionRoman;
      case 'optionGreek': return l10n.optionGreek;
      case 'optionAquiline': return l10n.optionAquiline;
      case 'optionFlat': return l10n.optionFlat;
      case 'optionSnub': return l10n.optionSnub;
      case 'optionBulbous': return l10n.optionBulbous;
      case 'optionPointed': return l10n.optionPointed;
      case 'optionFleshy': return l10n.optionFleshy;
      case 'optionRefined': return l10n.optionRefined;
      case 'optionLow': return l10n.optionLow;
      case 'optionHigh': return l10n.optionHigh;
      case 'optionDetached': return l10n.optionDetached;
      case 'optionAttached': return l10n.optionAttached;
      default: return '';
    }
  }
}
