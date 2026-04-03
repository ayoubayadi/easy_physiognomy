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

  /// No description provided for @questionEyebrowsThickness.
  ///
  /// In ar, this message translates to:
  /// **'ما هو سمك حاجبيك؟'**
  String get questionEyebrowsThickness;

  /// No description provided for @questionEyebrowsPosition.
  ///
  /// In ar, this message translates to:
  /// **'ما هو وضع حاجبيك؟'**
  String get questionEyebrowsPosition;

  /// No description provided for @questionEyebrowsShape.
  ///
  /// In ar, this message translates to:
  /// **'ما هو شكل حاجبيك؟'**
  String get questionEyebrowsShape;

  /// No description provided for @questionEyeSize.
  ///
  /// In ar, this message translates to:
  /// **'ما هو حجم عينيك؟'**
  String get questionEyeSize;

  /// No description provided for @questionEyeShape.
  ///
  /// In ar, this message translates to:
  /// **'ما هو شكل عينيك؟'**
  String get questionEyeShape;

  /// No description provided for @questionEyePositioning.
  ///
  /// In ar, this message translates to:
  /// **'ما هي وضعية عينيك؟'**
  String get questionEyePositioning;

  /// No description provided for @questionNoseStraightness.
  ///
  /// In ar, this message translates to:
  /// **'ما هو استقامة أنفك؟'**
  String get questionNoseStraightness;

  /// No description provided for @questionNoseLength.
  ///
  /// In ar, this message translates to:
  /// **'ما هو طول أنفك؟'**
  String get questionNoseLength;

  /// No description provided for @questionNoseWidth.
  ///
  /// In ar, this message translates to:
  /// **'ما هو عرض أنفك؟'**
  String get questionNoseWidth;

  /// No description provided for @questionNoseTipShape.
  ///
  /// In ar, this message translates to:
  /// **'ما هو شكل طرف أنفك (الأرنبة)؟'**
  String get questionNoseTipShape;

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

  /// No description provided for @optionRoman.
  ///
  /// In ar, this message translates to:
  /// **'روماني (أشم)'**
  String get optionRoman;

  /// No description provided for @optionGreek.
  ///
  /// In ar, this message translates to:
  /// **'يوناني (مستقيم)'**
  String get optionGreek;

  /// No description provided for @optionAquiline.
  ///
  /// In ar, this message translates to:
  /// **'إسرائيلي (أقنى)'**
  String get optionAquiline;

  /// No description provided for @optionFlat.
  ///
  /// In ar, this message translates to:
  /// **'أفطس'**
  String get optionFlat;

  /// No description provided for @optionSnub.
  ///
  /// In ar, this message translates to:
  /// **'أذلق'**
  String get optionSnub;

  /// No description provided for @optionBulbous.
  ///
  /// In ar, this message translates to:
  /// **'منتفخ'**
  String get optionBulbous;

  /// No description provided for @optionPointed.
  ///
  /// In ar, this message translates to:
  /// **'حاد'**
  String get optionPointed;

  /// No description provided for @optionFleshy.
  ///
  /// In ar, this message translates to:
  /// **'لحمي'**
  String get optionFleshy;

  /// No description provided for @optionRefined.
  ///
  /// In ar, this message translates to:
  /// **'دقيق'**
  String get optionRefined;

  /// No description provided for @resultEyebrowsThin.
  ///
  /// In ar, this message translates to:
  /// **'حاجبيك الرفيعان يدلان على الدقة والاهتمام بالتفاصيل الصغيرة.'**
  String get resultEyebrowsThin;

  /// No description provided for @resultEyebrowsThick.
  ///
  /// In ar, this message translates to:
  /// **'حاجبيك السميكين يدلان على قوة الشخصية والثقة العالية في القرارات.'**
  String get resultEyebrowsThick;

  /// No description provided for @resultEyebrowsConnected.
  ///
  /// In ar, this message translates to:
  /// **'حاجباك المتصلان يدلان على التفكير المترابط وحب الوحدة والتركيز.'**
  String get resultEyebrowsConnected;

  /// No description provided for @resultEyebrowsPartiallyConnected.
  ///
  /// In ar, this message translates to:
  /// **'حاجباك المتصلان جزئياً يدلان على التوازن بين الاستقلالية والتعاون حسب الموقف.'**
  String get resultEyebrowsPartiallyConnected;

  /// No description provided for @resultEyebrowsSeparated.
  ///
  /// In ar, this message translates to:
  /// **'حاجباك المتباعدان يدلان على الاستقلالية ووضوح التفكير المباشر.'**
  String get resultEyebrowsSeparated;

  /// No description provided for @resultEyebrowsStraight.
  ///
  /// In ar, this message translates to:
  /// **'حاجباك المستقيمان يدلان على المنهجية المباشرة والصريحة في التعامل.'**
  String get resultEyebrowsStraight;

  /// No description provided for @resultEyebrowsArched.
  ///
  /// In ar, this message translates to:
  /// **'حاجباك المقوسان يدلان على الحس الجمالي العالي والتعبير العاطفي القوي.'**
  String get resultEyebrowsArched;

  /// No description provided for @resultEyebrowsMountain.
  ///
  /// In ar, this message translates to:
  /// **'حاجباك الجبليان يدلان على الطموح الكبير وقوة الإرادة.'**
  String get resultEyebrowsMountain;

  /// No description provided for @resultEyeSizeLarge.
  ///
  /// In ar, this message translates to:
  /// **'عيناك الكبيرتان الواسعتان تدلان على اليقظة والحساسية العاطفية.'**
  String get resultEyeSizeLarge;

  /// No description provided for @resultEyeSizeSmall.
  ///
  /// In ar, this message translates to:
  /// **'عيناك الصغيرتان الضيقتان تشير إلى الخبص والمكر.'**
  String get resultEyeSizeSmall;

  /// No description provided for @resultEyeSizeMedium.
  ///
  /// In ar, this message translates to:
  /// **'عيناك المتوسطتان تدلان على التوازن بين اليقظة والعملية.'**
  String get resultEyeSizeMedium;

  /// No description provided for @resultEyeShapeProtruding.
  ///
  /// In ar, this message translates to:
  /// **'عيناك البارزتان ترمزان إلى الفضول وحب المعرفة.'**
  String get resultEyeShapeProtruding;

  /// No description provided for @resultEyeShapeDeepSet.
  ///
  /// In ar, this message translates to:
  /// **'عيناك الغائرتان تعكسان التفكير العميق والاهتمام بالتفاصيل.'**
  String get resultEyeShapeDeepSet;

  /// No description provided for @resultEyeShapeAlmond.
  ///
  /// In ar, this message translates to:
  /// **'عيناك اللوزيتان ترتبطان بالذكاء والجاذبية والحس الفني.'**
  String get resultEyeShapeAlmond;

  /// No description provided for @resultEyeShapeRound.
  ///
  /// In ar, this message translates to:
  /// **'عيناك المستديرتان تدلان على الود والطبيعة الاجتماعية.'**
  String get resultEyeShapeRound;

  /// No description provided for @resultEyePositioningWideApart.
  ///
  /// In ar, this message translates to:
  /// **'عيناك المتباعدتان تدلان على الاستقلالية والانفتاح.'**
  String get resultEyePositioningWideApart;

  /// No description provided for @resultEyePositioningCloseTogether.
  ///
  /// In ar, this message translates to:
  /// **'عيناك المتقاربتان تشير إلى التركيز والاهتمام بالتفاصيل.'**
  String get resultEyePositioningCloseTogether;

  /// No description provided for @resultEyePositioningMedium.
  ///
  /// In ar, this message translates to:
  /// **'عيناك المتوسطتا الوضعية تعكسان التوازن والتكيف.'**
  String get resultEyePositioningMedium;

  /// No description provided for @resultNoseStraightnessRoman.
  ///
  /// In ar, this message translates to:
  /// **'أنفك الروماني (الأشم) بقصبته المرتفعة يدل على القيادة والطموح وقوة الإرادة.'**
  String get resultNoseStraightnessRoman;

  /// No description provided for @resultNoseStraightnessGreek.
  ///
  /// In ar, this message translates to:
  /// **'أنفك اليوناني المستقيم يشير إلى الرقة الفنية والذوق الجمالي.'**
  String get resultNoseStraightnessGreek;

  /// No description provided for @resultNoseStraightnessAquiline.
  ///
  /// In ar, this message translates to:
  /// **'أنفك الإسرائيلي (الأقنى) المنحني يدل على المهارة التجارية والاقتدار في المبادلة.'**
  String get resultNoseStraightnessAquiline;

  /// No description provided for @resultNoseStraightnessFlat.
  ///
  /// In ar, this message translates to:
  /// **'أنفك الأفطس يشير إلى الضعف والانحطاط.'**
  String get resultNoseStraightnessFlat;

  /// No description provided for @resultNoseStraightnessSnub.
  ///
  /// In ar, this message translates to:
  /// **'أنفك الأذلق المقعر يعكس الفضول وخفة الروح.'**
  String get resultNoseStraightnessSnub;

  /// No description provided for @resultNoseLengthLong.
  ///
  /// In ar, this message translates to:
  /// **'أنفك الطويل يدل على العظمة والكرامة والقدرة على التنفيذ.'**
  String get resultNoseLengthLong;

  /// No description provided for @resultNoseLengthVeryLong.
  ///
  /// In ar, this message translates to:
  /// **'الطول المفرط في أرنبة أنفك يشير إلى الميل إلى السويداء والتأمل.'**
  String get resultNoseLengthVeryLong;

  /// No description provided for @resultNoseLengthShort.
  ///
  /// In ar, this message translates to:
  /// **'أنفك القصير يدل على التفكير العملي بدلاً من الاستراتيجي.'**
  String get resultNoseLengthShort;

  /// No description provided for @resultNoseLengthMedium.
  ///
  /// In ar, this message translates to:
  /// **'أنفك المتوسط الطول يعكس التوازن بين الطموح والعملية.'**
  String get resultNoseLengthMedium;

  /// No description provided for @resultNoseWidthWide.
  ///
  /// In ar, this message translates to:
  /// **'أنفك العريض يدل على القوة الجسدية والتحمل والحيوية.'**
  String get resultNoseWidthWide;

  /// No description provided for @resultNoseWidthNarrow.
  ///
  /// In ar, this message translates to:
  /// **'أنفك الضيق يوحي بالرقة ولكن قد يشير إلى قوة بدنية أقل.'**
  String get resultNoseWidthNarrow;

  /// No description provided for @resultNoseWidthMedium.
  ///
  /// In ar, this message translates to:
  /// **'أنفك المتوسط العرض يعكس التوازن بين القوة والرقة.'**
  String get resultNoseWidthMedium;

  /// No description provided for @resultNoseTipShapeFleshy.
  ///
  /// In ar, this message translates to:
  /// **'الأرنبة الكبيرة اللحمية تدل على الاهتمام الشديد بالمال والأمن المادي.'**
  String get resultNoseTipShapeFleshy;

  /// No description provided for @resultNoseTipShapeRefined.
  ///
  /// In ar, this message translates to:
  /// **'الرأس الدقيق الضيق يشير إلى المثالية.'**
  String get resultNoseTipShapeRefined;

  /// No description provided for @resultNoseTipShapeBulbous.
  ///
  /// In ar, this message translates to:
  /// **'الأرنبة المنتفخة تدل على الكرم والذكاء العاطفي.'**
  String get resultNoseTipShapeBulbous;

  /// No description provided for @resultNoseTipShapePointed.
  ///
  /// In ar, this message translates to:
  /// **'الرأس الحاد يوحي بطبيعة نقدية أو فضولية.'**
  String get resultNoseTipShapePointed;

  /// No description provided for @resultNoseTipShapeDrooping.
  ///
  /// In ar, this message translates to:
  /// **'الأرنبة المتدلية تدل على الحذر والتأني في القرارات.'**
  String get resultNoseTipShapeDrooping;

  /// No description provided for @resultNoseTipShapeUpturned.
  ///
  /// In ar, this message translates to:
  /// **'الأرنبة المنحرفة للأعلى تدل على التفاؤل وحب المغامرة.'**
  String get resultNoseTipShapeUpturned;

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

  /// No description provided for @questionMouthWidth.
  ///
  /// In ar, this message translates to:
  /// **'ما هو عرض فمك؟'**
  String get questionMouthWidth;

  /// No description provided for @questionLips.
  ///
  /// In ar, this message translates to:
  /// **'ما هي شكل شفتيك؟'**
  String get questionLips;

  /// No description provided for @questionJaw.
  ///
  /// In ar, this message translates to:
  /// **'ما هو شكل فكك؟'**
  String get questionJaw;

  /// No description provided for @questionChin.
  ///
  /// In ar, this message translates to:
  /// **'ما هو شكل ذقنك؟'**
  String get questionChin;

  /// No description provided for @optionNarrowMouth.
  ///
  /// In ar, this message translates to:
  /// **'ضيق'**
  String get optionNarrowMouth;

  /// No description provided for @optionMediumMouth.
  ///
  /// In ar, this message translates to:
  /// **'متوسط'**
  String get optionMediumMouth;

  /// No description provided for @optionWideMouth.
  ///
  /// In ar, this message translates to:
  /// **'واسع'**
  String get optionWideMouth;

  /// No description provided for @optionThinLips.
  ///
  /// In ar, this message translates to:
  /// **'رفيعة'**
  String get optionThinLips;

  /// No description provided for @optionMediumLips.
  ///
  /// In ar, this message translates to:
  /// **'متوسطة'**
  String get optionMediumLips;

  /// No description provided for @optionFullLips.
  ///
  /// In ar, this message translates to:
  /// **'ممتلئة'**
  String get optionFullLips;

  /// No description provided for @optionAsymmetricalLips.
  ///
  /// In ar, this message translates to:
  /// **'غير متماثلة'**
  String get optionAsymmetricalLips;

  /// No description provided for @optionNarrowJaw.
  ///
  /// In ar, this message translates to:
  /// **'ضيق'**
  String get optionNarrowJaw;

  /// No description provided for @optionMediumJaw.
  ///
  /// In ar, this message translates to:
  /// **'متوسط'**
  String get optionMediumJaw;

  /// No description provided for @optionWideJaw.
  ///
  /// In ar, this message translates to:
  /// **'واسع'**
  String get optionWideJaw;

  /// No description provided for @optionAngularJaw.
  ///
  /// In ar, this message translates to:
  /// **'زاوي'**
  String get optionAngularJaw;

  /// No description provided for @optionPointedChin.
  ///
  /// In ar, this message translates to:
  /// **'مدبب'**
  String get optionPointedChin;

  /// No description provided for @optionRoundedChin.
  ///
  /// In ar, this message translates to:
  /// **'مستدير'**
  String get optionRoundedChin;

  /// No description provided for @optionRecedingChin.
  ///
  /// In ar, this message translates to:
  /// **'متراجع'**
  String get optionRecedingChin;

  /// No description provided for @optionProminentChin.
  ///
  /// In ar, this message translates to:
  /// **'بارز'**
  String get optionProminentChin;

  /// No description provided for @resultMouthWidthNarrow.
  ///
  /// In ar, this message translates to:
  /// **'فمك الضيق يدل على التحفظ والقدرة على حفظ الأسرار.'**
  String get resultMouthWidthNarrow;

  /// No description provided for @resultMouthWidthMedium.
  ///
  /// In ar, this message translates to:
  /// **'فمك المتوسط يعكس التوازن بين التعبير والتحفظ.'**
  String get resultMouthWidthMedium;

  /// No description provided for @resultMouthWidthWide.
  ///
  /// In ar, this message translates to:
  /// **'فمك الواسع يدل على الانفتاح والاجتماعية والقدرة على التعبير.'**
  String get resultMouthWidthWide;

  /// No description provided for @resultLipsThin.
  ///
  /// In ar, this message translates to:
  /// **'شفتاك الرفيعتان تدلان على الحذر والدقة في الكلام.'**
  String get resultLipsThin;

  /// No description provided for @resultLipsMedium.
  ///
  /// In ar, this message translates to:
  /// **'شفتاك المتوسطتان تعكسان التوازن بين العاطفة والعملية.'**
  String get resultLipsMedium;

  /// No description provided for @resultLipsFull.
  ///
  /// In ar, this message translates to:
  /// **'شفتاك الممتلئتان تدلان على الكرم والعاطفة القوية.'**
  String get resultLipsFull;

  /// No description provided for @resultLipsAsymmetrical.
  ///
  /// In ar, this message translates to:
  /// **'شفتاك غير المتماثلتين تدلان على الإبداع والتفرد.'**
  String get resultLipsAsymmetrical;

  /// No description provided for @resultJawNarrow.
  ///
  /// In ar, this message translates to:
  /// **'فكك الضيق يدل على الحساسية والدقة في التعامل.'**
  String get resultJawNarrow;

  /// No description provided for @resultJawMedium.
  ///
  /// In ar, this message translates to:
  /// **'فكك المتوسط يعكس التوازن بين القوة والمرونة.'**
  String get resultJawMedium;

  /// No description provided for @resultJawWide.
  ///
  /// In ar, this message translates to:
  /// **'فكك الواسع يدل على القوة الشخصية والقدرة على القيادة.'**
  String get resultJawWide;

  /// No description provided for @resultJawAngular.
  ///
  /// In ar, this message translates to:
  /// **'فكك الزاوي يدل على التصميم والقوة الإرادية.'**
  String get resultJawAngular;

  /// No description provided for @resultChinPointed.
  ///
  /// In ar, this message translates to:
  /// **'ذقنك المدبب يدل على الذكاء والحدس القوي.'**
  String get resultChinPointed;

  /// No description provided for @resultChinRounded.
  ///
  /// In ar, this message translates to:
  /// **'ذقنك المستدير يدل على اللطف والطبيعة الاجتماعية.'**
  String get resultChinRounded;

  /// No description provided for @resultChinReceding.
  ///
  /// In ar, this message translates to:
  /// **'ذقنك المتراجع يدل على الدبلوماسية وتجنب المواجهة.'**
  String get resultChinReceding;

  /// No description provided for @resultChinProminent.
  ///
  /// In ar, this message translates to:
  /// **'ذقنك البارز يدل على الإرادة القوية والتصميم.'**
  String get resultChinProminent;

  /// No description provided for @history.
  ///
  /// In ar, this message translates to:
  /// **'السجل'**
  String get history;

  /// No description provided for @noHistory.
  ///
  /// In ar, this message translates to:
  /// **'لا يوجد تحليلات محفوظة بعد'**
  String get noHistory;

  /// No description provided for @questionsCompleted.
  ///
  /// In ar, this message translates to:
  /// **'أسئلة مكتملة'**
  String get questionsCompleted;

  /// No description provided for @saveAnalysis.
  ///
  /// In ar, this message translates to:
  /// **'حفظ التحليل'**
  String get saveAnalysis;

  /// No description provided for @viewHistory.
  ///
  /// In ar, this message translates to:
  /// **'عرض السجل'**
  String get viewHistory;

  /// No description provided for @personalityProfile.
  ///
  /// In ar, this message translates to:
  /// **'ملف شخصيتك'**
  String get personalityProfile;

  /// No description provided for @savedSuccessfully.
  ///
  /// In ar, this message translates to:
  /// **'تم حفظ التحليل بنجاح'**
  String get savedSuccessfully;

  /// No description provided for @thinkingStyle.
  ///
  /// In ar, this message translates to:
  /// **'أسلوب التفكير'**
  String get thinkingStyle;

  /// No description provided for @emotionalStyle.
  ///
  /// In ar, this message translates to:
  /// **'الأسلوب العاطفي'**
  String get emotionalStyle;

  /// No description provided for @socialStyle.
  ///
  /// In ar, this message translates to:
  /// **'الأسلوب الاجتماعي'**
  String get socialStyle;

  /// No description provided for @leadershipTrait.
  ///
  /// In ar, this message translates to:
  /// **'القيادة'**
  String get leadershipTrait;
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
