import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mokhtabary/utils/path_image.dart';
import 'package:mokhtabary/widgets/cards_lap.dart';
import 'package:mokhtabary/widgets/drawer.dart';
// ignore: duplicate_import
import 'package:firebase_auth/firebase_auth.dart';

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
          'Mokhtabary'.toUpperCase(),
          style: GoogleFonts.sora(color: Colors.yellowAccent),
        ),
        centerTitle: true,
        elevation: 2,
        //  leading: ,
      ),
      drawer: const ComponentDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                'Please Choose Lap :',
                style: GoogleFonts.lora(
                    fontSize: 30,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Column(
              children: [
                CardLaps(
                  tittle: 'Med Lap',
                  image: PathImage.medlap,
                  cardClick: () {},
                ),
                CardLaps(tittle: 'Med Lap', image: PathImage.medlap),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
