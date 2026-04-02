import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/providers/question_provider.dart';
import '../widgets/question_card.dart';
import '../widgets/result_display.dart';

class QuestionScreen extends ConsumerWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(questionProvider);
    final notifier = ref.read(questionProvider.notifier);
    final l10n = AppLocalizations.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(_getSectionTitle(l10n, state.currentSectionKey)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: (state.currentIndex + 1) / state.questions.length,
            minHeight: 4,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              '${l10n.question} ${state.currentIndex + 1} ${l10n.labelOf} ${state.questions.length}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  QuestionCard(),
                  SizedBox(height: 16),
                  ResultDisplay(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (state.canGoPrevious)
                  OutlinedButton.icon(
                    onPressed: () => notifier.previous(),
                    icon: const Icon(Icons.arrow_back),
                    label: Text(l10n.previous),
                  )
                else
                  const SizedBox.shrink(),
                if (state.isLastQuestion)
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/conclusion');
                    },
                    icon: const Icon(Icons.check),
                    label: Text(l10n.finish),
                  )
                else
                  ElevatedButton.icon(
                    onPressed: state.canGoNext ? () => notifier.next() : null,
                    icon: const Icon(Icons.arrow_forward),
                    label: Text(l10n.next),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  String _getSectionTitle(AppLocalizations l10n, String key) {
    switch (key) {
      case 'sectionUpper': return l10n.sectionUpper;
      case 'sectionMiddle': return l10n.sectionMiddle;
      case 'sectionLower': return l10n.sectionLower;
      default: return '';
    }
  }
}
