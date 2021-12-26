// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mokhtabary/Language/generated/key-lang.dart';
import 'package:mokhtabary/utils/path_image.dart';
import 'package:mokhtabary/views/test_screen.dart';
// ignore: duplicate_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mokhtabary/widgets/CArdS/cards_lap.dart';

class PatientSCreen extends StatefulWidget {
  static const String screenRoute = 'PatintScreen';
  const PatientSCreen({Key? key}) : super(key: key);

  @override
  _PatientSCreenState createState() => _PatientSCreenState();
}

class _PatientSCreenState extends State<PatientSCreen> {
  final _auth = FirebaseAuth.instance;
  late User logineduser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        logineduser = user;
        // ignore: avoid_print
        print(logineduser.email);
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

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
      ),
      //drawer: const ComponentDrawer(),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            // SizedBox(
            //   width: double.infinity,
            //   child: Text(
            //     KeyLang.choselap.tr(),
            //     style: GoogleFonts.lora(
            //         fontSize: 30,
            //         color: Colors.amber,
            //         fontWeight: FontWeight.bold),
            //   ),
            // ),
            const SizedBox(
              height: 8,
            ),
            Column(
              children: [
                CardLaps(
                  tittle: 'Med Lab',
                  image: PathImage.medlap,
                  cardClick: () {
                    Navigator.pushNamed(context, TestScreen.screenRoute);
                  },
                ),
                CardLaps(tittle: 'Alfa Lab', image: PathImage.alfa),
                CardLaps(tittle: 'Mega Lab', image: PathImage.mega),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
