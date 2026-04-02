import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/theme/app_theme.dart';
import 'features/analysis/presentation/screens/welcome_screen.dart';
import 'features/analysis/presentation/screens/question_screen.dart';
import 'features/analysis/presentation/screens/conclusion_screen.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  
  runApp(
    const ProviderScope(
      child: PhysioScopeApp(),
    ),
  );
}

class PhysioScopeApp extends StatelessWidget {
  const PhysioScopeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PhysioScope',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      
      // Localization setup with RTL support
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar'), // Arabic (RTL)
        Locale('en'), // English (LTR)
      ],
      locale: const Locale('ar'), // Default to Arabic
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl, // Force RTL for Arabic
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
          default:
            return MaterialPageRoute(
              builder: (_) => const WelcomeScreen(),
            );
        }
      },
    );
  }
}
