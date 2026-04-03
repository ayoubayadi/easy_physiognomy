import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocaleNotifier extends StateNotifier<Locale> {
  static const String _boxName = 'app_settings';
  static const String _localeKey = 'selected_locale';
  
  LocaleNotifier() : super(const Locale('ar')) {
    _loadLocale();
  }
  
  Future<void> _loadLocale() async {
    try {
      final box = await Hive.openBox(_boxName);
      final savedLocale = box.get(_localeKey, defaultValue: 'ar');
      state = Locale(savedLocale);
    } catch (e) {
      // Use default Arabic
    }
  }
  
  Future<void> setLocale(Locale locale) async {
    state = locale;
    try {
      final box = await Hive.openBox(_boxName);
      await box.put(_localeKey, locale.languageCode);
    } catch (e) {
      // Silent fail
    }
  }
  
  bool get isArabic => state.languageCode == 'ar';
  TextDirection get textDirection => isArabic ? TextDirection.rtl : TextDirection.ltr;
}

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  return LocaleNotifier();
});

final textDirectionProvider = Provider<TextDirection>((ref) {
  final locale = ref.watch(localeProvider);
  return locale.languageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr;
});
