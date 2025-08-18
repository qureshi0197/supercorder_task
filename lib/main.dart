import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/translations/en_US.dart';
import 'app/translations/ko_KR.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translationsKeys: {
        'en_US': enUS,
        'ko_KR': koKR,
      },
      locale: const Locale('ko', 'KR'), // default = Korean
      fallbackLocale: const Locale('en', 'US'),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
