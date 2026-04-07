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

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
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
    Locale('en')
  ];

  /// No description provided for @appTitle.
  ///
  /// In ar, this message translates to:
  /// **'وصل المسلم'**
  String get appTitle;

  /// No description provided for @home.
  ///
  /// In ar, this message translates to:
  /// **'الرئيسية'**
  String get home;

  /// No description provided for @categories.
  ///
  /// In ar, this message translates to:
  /// **'الأقسام'**
  String get categories;

  /// No description provided for @favorites.
  ///
  /// In ar, this message translates to:
  /// **'المفضلة'**
  String get favorites;

  /// No description provided for @settings.
  ///
  /// In ar, this message translates to:
  /// **'الإعدادات'**
  String get settings;

  /// No description provided for @search.
  ///
  /// In ar, this message translates to:
  /// **'بحث'**
  String get search;

  /// No description provided for @tasbeeh.
  ///
  /// In ar, this message translates to:
  /// **'السبحة'**
  String get tasbeeh;

  /// No description provided for @reminders.
  ///
  /// In ar, this message translates to:
  /// **'التذكيرات'**
  String get reminders;

  /// No description provided for @about.
  ///
  /// In ar, this message translates to:
  /// **'عن التطبيق'**
  String get about;

  /// No description provided for @morningAthkar.
  ///
  /// In ar, this message translates to:
  /// **'أذكار الصباح'**
  String get morningAthkar;

  /// No description provided for @eveningAthkar.
  ///
  /// In ar, this message translates to:
  /// **'أذكار المساء'**
  String get eveningAthkar;

  /// No description provided for @sleepAthkar.
  ///
  /// In ar, this message translates to:
  /// **'أذكار النوم'**
  String get sleepAthkar;

  /// No description provided for @wakeupAthkar.
  ///
  /// In ar, this message translates to:
  /// **'أذكار الاستيقاظ'**
  String get wakeupAthkar;

  /// No description provided for @prayerAthkar.
  ///
  /// In ar, this message translates to:
  /// **'أذكار الصلاة'**
  String get prayerAthkar;

  /// No description provided for @duaa.
  ///
  /// In ar, this message translates to:
  /// **'أدعية'**
  String get duaa;

  /// No description provided for @recent.
  ///
  /// In ar, this message translates to:
  /// **'الأحدث'**
  String get recent;

  /// No description provided for @searchAthkar.
  ///
  /// In ar, this message translates to:
  /// **'ابحث عن ذكر...'**
  String get searchAthkar;

  /// No description provided for @noResults.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد نتائج'**
  String get noResults;

  /// No description provided for @addedToFavorites.
  ///
  /// In ar, this message translates to:
  /// **'تمت الإضافة للمفضلة'**
  String get addedToFavorites;

  /// No description provided for @removedFromFavorites.
  ///
  /// In ar, this message translates to:
  /// **'تم الإزالة من المفضلة'**
  String get removedFromFavorites;

  /// No description provided for @fontSize.
  ///
  /// In ar, this message translates to:
  /// **'حجم الخط'**
  String get fontSize;

  /// No description provided for @darkMode.
  ///
  /// In ar, this message translates to:
  /// **'الوضع الليلي'**
  String get darkMode;

  /// No description provided for @language.
  ///
  /// In ar, this message translates to:
  /// **'اللغة'**
  String get language;

  /// No description provided for @notifications.
  ///
  /// In ar, this message translates to:
  /// **'الإشعارات'**
  String get notifications;

  /// No description provided for @prayerTimes.
  ///
  /// In ar, this message translates to:
  /// **'مواقيت الصلاة'**
  String get prayerTimes;

  /// No description provided for @qibla.
  ///
  /// In ar, this message translates to:
  /// **'القبلة'**
  String get qibla;

  /// No description provided for @share.
  ///
  /// In ar, this message translates to:
  /// **'مشاركة'**
  String get share;

  /// No description provided for @copy.
  ///
  /// In ar, this message translates to:
  /// **'نسخ'**
  String get copy;

  /// No description provided for @copied.
  ///
  /// In ar, this message translates to:
  /// **'تم النسخ بنجاح'**
  String get copied;

  /// No description provided for @completed.
  ///
  /// In ar, this message translates to:
  /// **'مكتمل'**
  String get completed;

  /// No description provided for @repetition.
  ///
  /// In ar, this message translates to:
  /// **'التكرار'**
  String get repetition;

  /// No description provided for @source.
  ///
  /// In ar, this message translates to:
  /// **'المصدر'**
  String get source;

  /// No description provided for @reset.
  ///
  /// In ar, this message translates to:
  /// **'إعادة ضبط'**
  String get reset;

  /// No description provided for @enableReminders.
  ///
  /// In ar, this message translates to:
  /// **'تفعيل التذكير'**
  String get enableReminders;

  /// No description provided for @reminderTime.
  ///
  /// In ar, this message translates to:
  /// **'وقت التذكير'**
  String get reminderTime;

  /// No description provided for @selectTime.
  ///
  /// In ar, this message translates to:
  /// **'اختر الوقت'**
  String get selectTime;
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
      'that was used.');
}
