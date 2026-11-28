import 'package:bookia/bookia_app.dart';
import 'package:bookia/core/networking/dio_factory.dart';
import 'package:bookia/core/services/locale/locale_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  await LocaleHelper.init();
  DioFactory.init();
  
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: [Locale('en')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
    child: const BookiaApp()
  ));
}