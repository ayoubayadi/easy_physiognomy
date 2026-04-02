import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In ar, this message translates to:
  /// **'فيزيو سكوب'**
  String get appTitle;

  /// No description provided for @appDescription.
  ///
  /// In ar, this message translates to:
  /// **'تحليل الشخصية من خلال ملامح الوجه'**
  String get appDescription;

  /// No description provided for @startAnalysis.
  ///
  /// In ar, this message translates to:
  /// **'ابدأ التحليل'**
  String get startAnalysis;

  /// No description provided for @next.
  ///
  /// In ar, this message translates to:
  /// **'التالي'**
  String get next;

  /// No description provided for @previous.
  ///
  /// In ar, this message translates to:
  /// **'السابق'**
  String get previous;

  /// No description provided for @finish.
  ///
  /// In ar, this message translates to:
  /// **'إنهاء'**
  String get finish;

  /// No description provided for @conclusion.
  ///
  /// In ar, this message translates to:
  /// **'الخلاصة'**
  String get conclusion;

  /// No description provided for @welcomeTitle.
  ///
  /// In ar, this message translates to:
  /// **'مرحباً بك في فيزيو سكوب'**
  String get welcomeTitle;

  /// No description provided for @welcomeSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'اكتشف شخصيتك من خلال تحليل ملامح وجهك'**
  String get welcomeSubtitle;

  /// No description provided for @startButton.
  ///
  /// In ar, this message translates to:
  /// **'ابدأ التحليل'**
  String get startButton;

  /// No description provided for @sectionUpper.
  ///
  /// In ar, this message translates to:
  /// **'القسم العلوي - العقل والإدراك'**
  String get sectionUpper;

  /// No description provided for @sectionMiddle.
  ///
  /// In ar, this message translates to:
  /// **'القسم الأوسط - العاطفة والتفاعل'**
  String get sectionMiddle;

  /// No description provided for @sectionLower.
  ///
  /// In ar, this message translates to:
  /// **'القسم السفلي - السلوك والتنفيذ'**
  String get sectionLower;

  /// No description provided for @questionUpperLength.
  ///
  /// In ar, this message translates to:
  /// **'ما هو طول الجزء العلوي من وجهك؟'**
  String get questionUpperLength;

  /// No description provided for @questionForeheadWidth.
  ///
  /// In ar, this message translates to:
  /// **'ما هو عرض جبهتك؟'**
  String get questionForeheadWidth;

  /// No description provided for @questionHairlineShape.
  ///
  /// In ar, this message translates to:
  /// **'ما هو شكل خط الشعر؟'**
  String get questionHairlineShape;

  /// No description provided for @optionLong.
  ///
  /// In ar, this message translates to:
  /// **'طويل'**
  String get optionLong;

  /// No description provided for @optionMedium.
  ///
  /// In ar, this message translates to:
  /// **'متوسط'**
  String get optionMedium;

  /// No description provided for @optionShort.
  ///
  /// In ar, this message translates to:
  /// **'قصير'**
  String get optionShort;

  /// No description provided for @optionWide.
  ///
  /// In ar, this message translates to:
  /// **'واسع'**
  String get optionWide;

  /// No description provided for @optionNarrow.
  ///
  /// In ar, this message translates to:
  /// **'ضيق'**
  String get optionNarrow;

  /// No description provided for @optionStraight.
  ///
  /// In ar, this message translates to:
  /// **'مستقيم'**
  String get optionStraight;

  /// No description provided for @optionCurved.
  ///
  /// In ar, this message translates to:
  /// **'منحني'**
  String get optionCurved;

  /// No description provided for @optionWidowsPeak.
  ///
  /// In ar, this message translates to:
  /// **'على شكل حرف M (أرملة)'**
  String get optionWidowsPeak;

  /// No description provided for @resultUpperLong.
  ///
  /// In ar, this message translates to:
  /// **'أنت شخص مفكر استراتيجي، تميل إلى التخطيط طويل المدى وتحليل المواقف بعمق قبل اتخاذ القرارات.'**
  String get resultUpperLong;

  /// No description provided for @resultUpperMedium.
  ///
  /// In ar, this message translates to:
  /// **'أنت متوازن في تفكيرك، تجمع بين التحليل الاستراتيجي والعمل العملي بفعالية.'**
  String get resultUpperMedium;

  /// No description provided for @resultUpperShort.
  ///
  /// In ar, this message translates to:
  /// **'أنت شخص عملي، تفضل التنفيذ المباشر والتركيز على الحاضر والنتائج الملموسة.'**
  String get resultUpperShort;

  /// No description provided for @resultForeheadWide.
  ///
  /// In ar, this message translates to:
  /// **'تمتع بقدرة عقلية واسعة وخيال خصب، وتستطيع رؤية الصورة الكبيرة بسهولة.'**
  String get resultForeheadWide;

  /// No description provided for @resultForeheadMedium.
  ///
  /// In ar, this message translates to:
  /// **'لديك توازن بين التفكير التحليلي والخيال، وتتعامل مع المعلومات بطريقة متوازنة.'**
  String get resultForeheadMedium;

  /// No description provided for @resultForeheadNarrow.
  ///
  /// In ar, this message translates to:
  /// **'تركز على التفاصيل الدقيقة، وتتميز بالدقة والانتباه للجزئيات المهمة.'**
  String get resultForeheadNarrow;

  /// No description provided for @resultHairlineStraight.
  ///
  /// In ar, this message translates to:
  /// **'تفكيرك منظم ومنهجي، تفضل البنية الواضحة والخطة المحددة.'**
  String get resultHairlineStraight;

  /// No description provided for @resultHairlineCurved.
  ///
  /// In ar, this message translates to:
  /// **'تفكيرك مرن ومتكيف، تستطيع التعامل مع المواقف المتغيرة بسهولة.'**
  String get resultHairlineCurved;

  /// No description provided for @resultHairlineWidowsPeak.
  ///
  /// In ar, this message translates to:
  /// **'تتميز بإبداع كبير وتفكير غير تقليدي، وتجد حلولاً مبتكرة للمشاكل.'**
  String get resultHairlineWidowsPeak;

  /// No description provided for @question.
  ///
  /// In ar, this message translates to:
  /// **'السؤال'**
  String get question;

  /// No description provided for @labelOf.
  ///
  /// In ar, this message translates to:
  /// **'من'**
  String get labelOf;

  /// No description provided for @analysisResult.
  ///
  /// In ar, this message translates to:
  /// **'نتيجة التحليل'**
  String get analysisResult;

  /// No description provided for @conclusionComingSoon.
  ///
  /// In ar, this message translates to:
  /// **'ميزة الخلاصة قادمة قريباً. أكمل جميع الأقسام للحصول على التحليل الشامل.'**
  String get conclusionComingSoon;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
