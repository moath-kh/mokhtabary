// ignore: implementation_imports
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
// ignore: implementation_imports, unnecessary_import
import 'package:easy_localization/src/public_ext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mokhtabary/Language/generated/key-lang.dart';
import 'package:mokhtabary/utils/path_image.dart';
import 'package:mokhtabary/views/controller/auth.dart';
import 'package:mokhtabary/views/recepion_screen.dart';
import 'package:mokhtabary/widgets/CArdS/card_user.dart';
import 'package:mokhtabary/widgets/Drawer/drawer.dart';
import 'package:provider/provider.dart';

class LapSCreen extends StatefulWidget {
  static const String screenRoute = 'LapSCreen';
  const LapSCreen({Key? key}) : super(key: key);

  @override
  State<LapSCreen> createState() => _LapSCreenState();
}

class _LapSCreenState extends State<LapSCreen> {
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
    final rules = Provider.of<AuthState>(context).auth['rules'];
    if (rules == 'admin') {
      // get orders from firebase
    }
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
      drawer: const ComponentDrawer(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('request')
            .orderBy('date', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.red,
              child: const Center(
                child: Text(
                  'Error !',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (BuildContext context, int index) {
              final result = snapshot.data.docs[index].data();
              final requestId = snapshot.data.docs[index].id;
              return CardUser(
                  cardClick: () {
                    Navigator.pushNamed(context, AfterRerustScreen.screenRoute,
                        arguments: [requestId, result]);
                  },
                  tittle: result['name'] ?? 'user',
                  image: PathImage.request,
                  date: KeyLang.date.tr() +
                      DateFormat('y / M / d')
                          .format(result['date'].toDate())
                          .toString());
            },
          );
        },
      ),
      
    );
  }
}
