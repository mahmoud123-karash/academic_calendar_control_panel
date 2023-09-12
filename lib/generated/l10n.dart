// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `التقويم الدراسي`
  String get title {
    return Intl.message(
      'التقويم الدراسي',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `العام الدراسى`
  String get year {
    return Intl.message(
      'العام الدراسى',
      name: 'year',
      desc: '',
      args: [],
    );
  }

  /// `إضافة مناسبة`
  String get mon {
    return Intl.message(
      'إضافة مناسبة',
      name: 'mon',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `logout`
  String get logout {
    return Intl.message(
      'logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل دخول`
  String get login {
    return Intl.message(
      'تسجيل دخول',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `هل تريد تسجيل الخروج؟`
  String get logoutm {
    return Intl.message(
      'هل تريد تسجيل الخروج؟',
      name: 'logoutm',
      desc: '',
      args: [],
    );
  }

  /// `تأكيد`
  String get ok {
    return Intl.message(
      'تأكيد',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `لا`
  String get no {
    return Intl.message(
      'لا',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `لوحة التحكم`
  String get control {
    return Intl.message(
      'لوحة التحكم',
      name: 'control',
      desc: '',
      args: [],
    );
  }

  /// `عرض أحداث العام الحالى`
  String get message {
    return Intl.message(
      'عرض أحداث العام الحالى',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `تاريخ اليوم`
  String get date {
    return Intl.message(
      'تاريخ اليوم',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `اختر العام الدراسي`
  String get yearc {
    return Intl.message(
      'اختر العام الدراسي',
      name: 'yearc',
      desc: '',
      args: [],
    );
  }

  /// `تفاصيل الحدث`
  String get eventd {
    return Intl.message(
      'تفاصيل الحدث',
      name: 'eventd',
      desc: '',
      args: [],
    );
  }

  /// `تعديل الحدث`
  String get evente {
    return Intl.message(
      'تعديل الحدث',
      name: 'evente',
      desc: '',
      args: [],
    );
  }

  /// `إضافة حدث`
  String get eventa {
    return Intl.message(
      'إضافة حدث',
      name: 'eventa',
      desc: '',
      args: [],
    );
  }

  /// `حذف الحدث`
  String get delete {
    return Intl.message(
      'حذف الحدث',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `هل تريد حذف الحدث؟`
  String get deletem {
    return Intl.message(
      'هل تريد حذف الحدث؟',
      name: 'deletem',
      desc: '',
      args: [],
    );
  }

  /// `تعيين كلمة السر`
  String get passf {
    return Intl.message(
      'تعيين كلمة السر',
      name: 'passf',
      desc: '',
      args: [],
    );
  }

  /// `هل نسيت كلمة المرور؟`
  String get fpass {
    return Intl.message(
      'هل نسيت كلمة المرور؟',
      name: 'fpass',
      desc: '',
      args: [],
    );
  }

  /// `تعيين كلمة السر`
  String get pass {
    return Intl.message(
      'تعيين كلمة السر',
      name: 'pass',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get eventname {
    return Intl.message(
      '',
      name: 'eventname',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get eventdate {
    return Intl.message(
      '',
      name: 'eventdate',
      desc: '',
      args: [],
    );
  }

  /// `تعديل`
  String get eventte {
    return Intl.message(
      'تعديل',
      name: 'eventte',
      desc: '',
      args: [],
    );
  }

  /// `  `
  String get eventde {
    return Intl.message(
      '  ',
      name: 'eventde',
      desc: '',
      args: [],
    );
  }

  /// ` `
  String get image {
    return Intl.message(
      ' ',
      name: 'image',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get add {
    return Intl.message(
      '',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get validate {
    return Intl.message(
      '',
      name: 'validate',
      desc: '',
      args: [],
    );
  }

  /// ` `
  String get imagee {
    return Intl.message(
      ' ',
      name: 'imagee',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get imaged {
    return Intl.message(
      '',
      name: 'imaged',
      desc: '',
      args: [],
    );
  }

  /// `البريد الإلكترونى`
  String get email {
    return Intl.message(
      'البريد الإلكترونى',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get passl {
    return Intl.message(
      '',
      name: 'passl',
      desc: '',
      args: [],
    );
  }

  /// `مرحبا`
  String get hello {
    return Intl.message(
      'مرحبا',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `profile`
  String get profile {
    return Intl.message(
      'profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get logins {
    return Intl.message(
      '',
      name: 'logins',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get loginf {
    return Intl.message(
      '',
      name: 'loginf',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get emailres {
    return Intl.message(
      '',
      name: 'emailres',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get emails {
    return Intl.message(
      '',
      name: 'emails',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get empty {
    return Intl.message(
      '',
      name: 'empty',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get search {
    return Intl.message(
      '',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get searchp {
    return Intl.message(
      '',
      name: 'searchp',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get research {
    return Intl.message(
      '',
      name: 'research',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get eventwi {
    return Intl.message(
      '',
      name: 'eventwi',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get sendnoti {
    return Intl.message(
      '',
      name: 'sendnoti',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get addimage {
    return Intl.message(
      '',
      name: 'addimage',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get noti {
    return Intl.message(
      '',
      name: 'noti',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get send {
    return Intl.message(
      '',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get notit {
    return Intl.message(
      '',
      name: 'notit',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get bannerdelete {
    return Intl.message(
      '',
      name: 'bannerdelete',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get uri {
    return Intl.message(
      '',
      name: 'uri',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get change {
    return Intl.message(
      '',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get urii {
    return Intl.message(
      '',
      name: 'urii',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get imagei {
    return Intl.message(
      '',
      name: 'imagei',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get banner {
    return Intl.message(
      '',
      name: 'banner',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get nobanners {
    return Intl.message(
      '',
      name: 'nobanners',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get messagenoti {
    return Intl.message(
      '',
      name: 'messagenoti',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
