// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mokhtabary/Language/generated/key-lang.dart';
import 'package:mokhtabary/views/location_screen.dart';
import 'package:mokhtabary/widgets/CArdS/card_test.dart';

class TestScreen extends StatefulWidget {
  static const String screenRoute = 'testscreen';
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[900],
        title: Text(
          KeyLang.appName.tr(),
          style: GoogleFonts.sora(color: Colors.yellowAccent),
        ),
        centerTitle: true,
        elevation: 2,
        //  leading: ,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            CardTest(
              nametest: KeyLang.cbc.tr(),
              onPassed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AfterTest(
                      tittle: KeyLang.cbc.tr(),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            CardTest(
              nametest: KeyLang.d.tr(),
              onPassed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AfterTest(
                      tittle: KeyLang.d.tr(),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            CardTest(
              nametest: KeyLang.ur.tr(),
              onPassed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AfterTest(
                      tittle: KeyLang.ur.tr(),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            CardTest(
              nametest: KeyLang.sugret.tr(),
              onPassed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AfterTest(
                      tittle: KeyLang.sugret.tr(),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            CardTest(
              nametest: KeyLang.covid.tr(),
              onPassed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AfterTest(
                      tittle: KeyLang.covid.tr(),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            CardTest(
              nametest: KeyLang.b12.tr(),
              onPassed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AfterTest(
                      tittle: KeyLang.b12.tr(),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            CardTest(
              nametest: KeyLang.kft.tr(),
              onPassed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AfterTest(
                      tittle: KeyLang.kft.tr(),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            CardTest(
              nametest: KeyLang.lft.tr(),
              onPassed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AfterTest(
                      tittle: KeyLang.lft.tr(),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
