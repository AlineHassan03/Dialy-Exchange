import 'package:flutter/material.dart';

import 'package:flutter_application_3/app/auth/login_screen.dart';
import 'package:flutter_application_3/app/home_screen/home_screen.dart';
import 'package:flutter_application_3/app/splash_screens/animated_splash_screen.dart';
import 'package:flutter_application_3/app/splash_screens/splash_screen.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'components/applocal.dart';
import 'components/shaerd_pref/shared.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheService.init();
  Profile().init();
  Profile().initLanguage();
  Profile().initcurrency();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);
  /* |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||////////////////////////////////////// */
  static MyAppState? of(BuildContext context) {
    return context.findAncestorStateOfType<MyAppState>();
  }
  /*^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ */
  //إدارة الحالة: تُمكنك من الوصول إلى حالة الويدجتات السابقة وتحديثها من الويدجتات الفرعية، مما يُسهل التواصل بين أجزاء مختلفة من شجرة الويدجت.

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  void changeLanguage(Locale value) async {
    setState(() {
      Profile.locale = value;
    });
    await CacheService.saveData(key: "lang", value: value.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "daily expense",
      home: SplashScreen(),
      locale: Profile.locale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "rubik"),
      supportedLocales: const [Locale('en'), Locale('ar')],
      localizationsDelegates: [
        AppLocale.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        for (var locale in supportedLocales) {
          if (deviceLocale != null &&
              deviceLocale.languageCode == locale.languageCode) {
            return deviceLocale;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}

class Profile {
  static String? email;
  static String? currency = "USD";
  static Locale? locale;
  static bool? onBording;
  void init() async {
    onBording = await CacheService.getSaveData(key: "onboarding");
    email = await CacheService.getSaveData(key: "email");
  }

  void initcurrency() async {
    if (await CacheService.getSaveData(key: "currency") != null) {
      currency = await CacheService.getSaveData(key: "currency");
    }
  }

  void initLanguage() async {
    String? langText = await CacheService.getSaveData(key: "lang");
    if (langText != null) {
      locale = Locale(langText);
    }
  }

  Widget homePage() {
    if (onBording != null) {
      if (email != null) {
        return HomeScreen();
      } else {
        return LoginScreen();
      }
    } else {
      return IntroApplicationScreen();
    }
  }
}
