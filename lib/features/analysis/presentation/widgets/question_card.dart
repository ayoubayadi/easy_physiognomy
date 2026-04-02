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
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              _getQuestionText(l10n, question.questionKey),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ...question.options.asMap().entries.map((entry) {
              final index = entry.key;
              final option = entry.value;
              final isSelected = question.selectedOptionIndex == index;
              
              return CheckboxListTile(
                value: isSelected,
                onChanged: (value) {
                  ref.read(questionProvider.notifier).selectOption(state.currentIndex, index);
                },
                title: Text(
                  _getOptionText(l10n, option.labelKey),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Theme.of(context).colorScheme.primary,
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
      default: return '';
    }
  }
}
