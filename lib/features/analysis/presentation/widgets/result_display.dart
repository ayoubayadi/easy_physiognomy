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
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.lightbulb_outline,
                color: Theme.of(context).colorScheme.primary,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                l10n.analysisResult,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            resultText,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
  
  String _getResultText(AppLocalizations l10n, String key) {
    switch (key) {
      case 'resultUpperLong': return l10n.resultUpperLong;
      case 'resultUpperMedium': return l10n.resultUpperMedium;
      case 'resultUpperShort': return l10n.resultUpperShort;
      case 'resultForeheadWide': return l10n.resultForeheadWide;
      case 'resultForeheadMedium': return l10n.resultForeheadMedium;
      case 'resultForeheadNarrow': return l10n.resultForeheadNarrow;
      case 'resultHairlineStraight': return l10n.resultHairlineStraight;
      case 'resultHairlineCurved': return l10n.resultHairlineCurved;
      case 'resultHairlineWidowsPeak': return l10n.resultHairlineWidowsPeak;
      default: return '';
    }
  }
}
