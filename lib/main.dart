import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mokhtabary/Language/Config/config-lang.dart';
import 'package:mokhtabary/theme/custome_theme.dart';
import 'package:mokhtabary/views/afterlogin_screen.dart';
import 'package:mokhtabary/views/home.dart';
import 'package:mokhtabary/views/patient_screen.dart';
import 'package:mokhtabary/views/rigester_screen.dart';
import 'package:mokhtabary/views/screen_card.dart';
import 'package:mokhtabary/views/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    child: const MyApp(),
    supportedLocales: const [
      ConfigLanguage.AR_LOCALE,
      ConfigLanguage.EN_LOCALE
    ],
    path: ConfigLanguage.LANG_PATH,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final _auth = FirebaseAuth.instance;
    return MaterialApp(
      title: 'Mokhtabary',
      debugShowCheckedModeBanner: false,

      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      // theme: ThemeData.dark(),
      theme: CustomeTheme.light,
      themeMode: ThemeMode.light,
      darkTheme: CustomeTheme.dark,
      // home: PatientSCreen(),
      initialRoute: PageSplash.id,
      routes: {
        PageSplash.id: (context) => const PageSplash(),
        PageHome.screenRoute: (context) => const PageHome(),
        CardScreen.screenRoute: (context) => const CardScreen(),
        LoginScreen.screenRoute: (context) => const LoginScreen(),
        Rigsteraition.screenRoute: (context) => const Rigsteraition(),
        PatientSCreen.screenRoute: (context) => const PatientSCreen(),
      },
    );
  }
}
