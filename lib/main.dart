import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/theme/app_theme.dart';
import 'core/providers/locale_provider.dart';
import 'features/analysis/domain/models/analysis_history.dart';
import 'features/analysis/presentation/screens/welcome_screen.dart';
import 'features/analysis/presentation/screens/question_screen.dart';
import 'features/analysis/presentation/screens/conclusion_screen.dart';
import 'features/analysis/presentation/screens/history_screen.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(AnalysisHistoryAdapter());
  
  runApp(
    const ProviderScope(
      child: PhysioScopeApp(),
    ),
  );
}

class PhysioScopeApp extends ConsumerWidget {
  const PhysioScopeApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final textDirection = ref.watch(textDirectionProvider);
    
    return MaterialApp(
      title: 'PhysioScope',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      
      // Dynamic locale
      locale: locale,
      
      // Localization setup with RTL/LTR support
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar'), // Arabic (RTL)
        Locale('en'), // English (LTR)
      ],
      
      // Dynamic text direction
      builder: (context, child) {
        return Directionality(
          textDirection: textDirection,
          child: child!,
        );
      },
      
      // Routes
      initialRoute: '/welcome',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/welcome':
            return MaterialPageRoute(
              builder: (_) => const WelcomeScreen(),
            );
          case '/question':
            return MaterialPageRoute(
              builder: (_) => const QuestionScreen(),
            );
          case '/conclusion':
            return MaterialPageRoute(
              builder: (_) => const ConclusionScreen(),
            );
          case '/history':
            return MaterialPageRoute(
              builder: (_) => const HistoryScreen(),
            );
          default:
            return MaterialPageRoute(
              builder: (_) => const WelcomeScreen(),
            );
        }
      },
    );
  }
}
