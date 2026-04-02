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

  /// No description provided for @questionEyebrows.
  ///
  /// In ar, this message translates to:
  /// **'ما هو شكل حاجبيك؟'**
  String get questionEyebrows;

  /// No description provided for @questionEyes.
  ///
  /// In ar, this message translates to:
  /// **'ما هي شكل عيناك؟'**
  String get questionEyes;

  /// No description provided for @questionEyeDistance.
  ///
  /// In ar, this message translates to:
  /// **'ما هي المسافة بين عينيك؟'**
  String get questionEyeDistance;

  /// No description provided for @questionNose.
  ///
  /// In ar, this message translates to:
  /// **'ما هو شكل أنفك؟'**
  String get questionNose;

  /// No description provided for @questionEarSize.
  ///
  /// In ar, this message translates to:
  /// **'ما هو حجم أذنيك؟'**
  String get questionEarSize;

  /// No description provided for @questionEarPosition.
  ///
  /// In ar, this message translates to:
  /// **'ما هو موقع أذنيك؟'**
  String get questionEarPosition;

  /// No description provided for @questionEarlobe.
  ///
  /// In ar, this message translates to:
  /// **'ما هو شكل شحمة أذنك؟'**
  String get questionEarlobe;

  /// No description provided for @optionThin.
  ///
  /// In ar, this message translates to:
  /// **'رفيع'**
  String get optionThin;

  /// No description provided for @optionThick.
  ///
  /// In ar, this message translates to:
  /// **'سميك'**
  String get optionThick;

  /// No description provided for @optionConnected.
  ///
  /// In ar, this message translates to:
  /// **'متصل'**
  String get optionConnected;

  /// No description provided for @optionPartiallyConnected.
  ///
  /// In ar, this message translates to:
  /// **'متصل جزئياً'**
  String get optionPartiallyConnected;

  /// No description provided for @optionSeparated.
  ///
  /// In ar, this message translates to:
  /// **'متباعد'**
  String get optionSeparated;

  /// No description provided for @optionArched.
  ///
  /// In ar, this message translates to:
  /// **'مقوس'**
  String get optionArched;

  /// No description provided for @optionMountain.
  ///
  /// In ar, this message translates to:
  /// **'جبلي'**
  String get optionMountain;

  /// No description provided for @optionProtruding.
  ///
  /// In ar, this message translates to:
  /// **'بارز'**
  String get optionProtruding;

  /// No description provided for @optionSmall.
  ///
  /// In ar, this message translates to:
  /// **'صغير'**
  String get optionSmall;

  /// No description provided for @optionLarge.
  ///
  /// In ar, this message translates to:
  /// **'كبير'**
  String get optionLarge;

  /// No description provided for @optionDeepSet.
  ///
  /// In ar, this message translates to:
  /// **'غائرة'**
  String get optionDeepSet;

  /// No description provided for @optionRound.
  ///
  /// In ar, this message translates to:
  /// **'مستدير'**
  String get optionRound;

  /// No description provided for @optionAlmond.
  ///
  /// In ar, this message translates to:
  /// **'لوزي'**
  String get optionAlmond;

  /// No description provided for @optionWideApart.
  ///
  /// In ar, this message translates to:
  /// **'متباعدتان'**
  String get optionWideApart;

  /// No description provided for @optionCloseTogether.
  ///
  /// In ar, this message translates to:
  /// **'متقاربتان'**
  String get optionCloseTogether;

  /// No description provided for @optionStraightNose.
  ///
  /// In ar, this message translates to:
  /// **'مستقيم'**
  String get optionStraightNose;

  /// No description provided for @optionConvex.
  ///
  /// In ar, this message translates to:
  /// **'محدب'**
  String get optionConvex;

  /// No description provided for @optionLongNose.
  ///
  /// In ar, this message translates to:
  /// **'طويل'**
  String get optionLongNose;

  /// No description provided for @optionShortNose.
  ///
  /// In ar, this message translates to:
  /// **'قصير'**
  String get optionShortNose;

  /// No description provided for @optionWideNose.
  ///
  /// In ar, this message translates to:
  /// **'عريض'**
  String get optionWideNose;

  /// No description provided for @optionNarrowNose.
  ///
  /// In ar, this message translates to:
  /// **'ضيق'**
  String get optionNarrowNose;

  /// No description provided for @optionDroopingTip.
  ///
  /// In ar, this message translates to:
  /// **'طرف متدلي'**
  String get optionDroopingTip;

  /// No description provided for @optionUpturnedTip.
  ///
  /// In ar, this message translates to:
  /// **'طرف منحرف للأعلى'**
  String get optionUpturnedTip;

  /// No description provided for @optionLow.
  ///
  /// In ar, this message translates to:
  /// **'منخفض'**
  String get optionLow;

  /// No description provided for @optionHigh.
  ///
  /// In ar, this message translates to:
  /// **'مرتفع'**
  String get optionHigh;

  /// No description provided for @optionDetached.
  ///
  /// In ar, this message translates to:
  /// **'منفصلة'**
  String get optionDetached;

  /// No description provided for @optionAttached.
  ///
  /// In ar, this message translates to:
  /// **'ملتصقة'**
  String get optionAttached;

  /// No description provided for @resultEyebrowsThin.
  ///
  /// In ar, this message translates to:
  /// **'تحليلك دقيق وتميل إلى التركيز على التفاصيل الصغيرة.'**
  String get resultEyebrowsThin;

  /// No description provided for @resultEyebrowsThick.
  ///
  /// In ar, this message translates to:
  /// **'لديك قوة شخصية وثقة عالية في قراراتك.'**
  String get resultEyebrowsThick;

  /// No description provided for @resultEyebrowsConnected.
  ///
  /// In ar, this message translates to:
  /// **'أنت شخص مترابط التفكير وتفضل الوحدة والتركيز.'**
  String get resultEyebrowsConnected;

  /// No description provided for @resultEyebrowsPartiallyConnected.
  ///
  /// In ar, this message translates to:
  /// **'تجمع بين الاستقلالية والتعاون حسب الموقف.'**
  String get resultEyebrowsPartiallyConnected;

  /// No description provided for @resultEyebrowsSeparated.
  ///
  /// In ar, this message translates to:
  /// **'أنت شخص مستقل وتفكيرك واضح ومباشر.'**
  String get resultEyebrowsSeparated;

  /// No description provided for @resultEyebrowsStraight.
  ///
  /// In ar, this message translates to:
  /// **'منهجيتك مباشرة وصريحة في التعامل مع الأمور.'**
  String get resultEyebrowsStraight;

  /// No description provided for @resultEyebrowsArched.
  ///
  /// In ar, this message translates to:
  /// **'لديك حس جمالي عالي وتعبير عاطفي قوي.'**
  String get resultEyebrowsArched;

  /// No description provided for @resultEyebrowsMountain.
  ///
  /// In ar, this message translates to:
  /// **'طموحك كبير ولديك قوة إرادة قوية.'**
  String get resultEyebrowsMountain;

  /// No description provided for @resultEyesProtruding.
  ///
  /// In ar, this message translates to:
  /// **'أنت جريء وصريح في التعبير عن مشاعرك.'**
  String get resultEyesProtruding;

  /// No description provided for @resultEyesSmall.
  ///
  /// In ar, this message translates to:
  /// **'تركيزك عالي وتلاحظ التفاصيل التي يغفلها الآخرون.'**
  String get resultEyesSmall;

  /// No description provided for @resultEyesMedium.
  ///
  /// In ar, this message translates to:
  /// **'توازن بين التعبير العاطفي والتحفظ.'**
  String get resultEyesMedium;

  /// No description provided for @resultEyesLarge.
  ///
  /// In ar, this message translates to:
  /// **'أنت شخص تعبيري ومنفتح عاطفياً.'**
  String get resultEyesLarge;

  /// No description provided for @resultEyesDeepSet.
  ///
  /// In ar, this message translates to:
  /// **'أنت عميق التفكير وتحب التأمل والتحليل.'**
  String get resultEyesDeepSet;

  /// No description provided for @resultEyesRound.
  ///
  /// In ar, this message translates to:
  /// **'أنت ودود واجتماعي بطبعك.'**
  String get resultEyesRound;

  /// No description provided for @resultEyesAlmond.
  ///
  /// In ar, this message translates to:
  /// **'لديك حدة ملاحظة وقدرة على قراءة الآخرين.'**
  String get resultEyesAlmond;

  /// No description provided for @resultEyeDistanceWide.
  ///
  /// In ar, this message translates to:
  /// **'أنت منفتح اجتماعياً وتحب التنوع في التجارب.'**
  String get resultEyeDistanceWide;

  /// No description provided for @resultEyeDistanceMedium.
  ///
  /// In ar, this message translates to:
  /// **'توازن بين الحياة الاجتماعية والخصوصية الشخصية.'**
  String get resultEyeDistanceMedium;

  /// No description provided for @resultEyeDistanceClose.
  ///
  /// In ar, this message translates to:
  /// **'تركيزك عميق وتفضل العلاقات الوثيقة.'**
  String get resultEyeDistanceClose;

  /// No description provided for @resultNoseStraight.
  ///
  /// In ar, this message translates to:
  /// **'أنت شخص مباشر وواضح في أهدافك.'**
  String get resultNoseStraight;

  /// No description provided for @resultNoseConvex.
  ///
  /// In ar, this message translates to:
  /// **'لديك طموح عالي ورغبة في التميز.'**
  String get resultNoseConvex;

  /// No description provided for @resultNoseLong.
  ///
  /// In ar, this message translates to:
  /// **'أنت حكيم وتفكر بعناية قبل التصرف.'**
  String get resultNoseLong;

  /// No description provided for @resultNoseShort.
  ///
  /// In ar, this message translates to:
  /// **'أنت سريع البديهة وتفضل الحلول العملية.'**
  String get resultNoseShort;

  /// No description provided for @resultNoseWide.
  ///
  /// In ar, this message translates to:
  /// **'لديك ثقة عالية وقدرة على القيادة.'**
  String get resultNoseWide;

  /// No description provided for @resultNoseNarrow.
  ///
  /// In ar, this message translates to:
  /// **'أنت دقيق ومركز في عملك.'**
  String get resultNoseNarrow;

  /// No description provided for @resultNoseDroopingTip.
  ///
  /// In ar, this message translates to:
  /// **'أنت حذر ومتأنٍ في قراراتك.'**
  String get resultNoseDroopingTip;

  /// No description provided for @resultNoseUpturnedTip.
  ///
  /// In ar, this message translates to:
  /// **'أنت متفائل وتحب المغامرة.'**
  String get resultNoseUpturnedTip;

  /// No description provided for @resultEarSizeSmall.
  ///
  /// In ar, this message translates to:
  /// **'أنت سريع التعلم وتلتقط المعلومات بسرعة.'**
  String get resultEarSizeSmall;

  /// No description provided for @resultEarSizeMedium.
  ///
  /// In ar, this message translates to:
  /// **'توازن بين سرعة التعلم والاستيعاب العميق.'**
  String get resultEarSizeMedium;

  /// No description provided for @resultEarSizeLarge.
  ///
  /// In ar, this message translates to:
  /// **'أنت صبور في التعلم وتحب التعمق في المواضيع.'**
  String get resultEarSizeLarge;

  /// No description provided for @resultEarPositionLow.
  ///
  /// In ar, this message translates to:
  /// **'تفكيرك عملي وتميل إلى التطبيق العملي.'**
  String get resultEarPositionLow;

  /// No description provided for @resultEarPositionMedium.
  ///
  /// In ar, this message translates to:
  /// **'توازن بين النظرية والتطبيق.'**
  String get resultEarPositionMedium;

  /// No description provided for @resultEarPositionHigh.
  ///
  /// In ar, this message translates to:
  /// **'أنت مفكر نظري وتحب المفاهيم المجردة.'**
  String get resultEarPositionHigh;

  /// No description provided for @resultEarlobeSmall.
  ///
  /// In ar, this message translates to:
  /// **'أنت مستقل في تفكيرك وتفضل اتخاذ قراراتك بنفسك.'**
  String get resultEarlobeSmall;

  /// No description provided for @resultEarlobeLarge.
  ///
  /// In ar, this message translates to:
  /// **'أنت كريم وتميل إلى العطاء.'**
  String get resultEarlobeLarge;

  /// No description provided for @resultEarlobeDetached.
  ///
  /// In ar, this message translates to:
  /// **'أنت مبدع وتفكر خارج الصندوق.'**
  String get resultEarlobeDetached;

  /// No description provided for @resultEarlobeAttached.
  ///
  /// In ar, this message translates to:
  /// **'أنت عملي وتفضل الأساليب التقليدية المجربة.'**
  String get resultEarlobeAttached;
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
