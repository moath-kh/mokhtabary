import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mokhtabary/Language/generated/key-lang.dart';

class AboutScreen extends StatefulWidget {
    static const String screenRoute = 'aboutscreen';
  const AboutScreen({ Key? key }) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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
      body: Text(KeyLang.about),
   
    );
  }
}