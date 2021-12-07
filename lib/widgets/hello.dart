// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mokhtabary/Language/generated/key-lang.dart';

class HelloScreen extends StatelessWidget {
  const HelloScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: 25,
            left: 25,
            top: 70,
          ),
          child: Text(KeyLang.helo.tr(),
              style: GoogleFonts.pacifico(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber)),
        ),
      ],
    );
  }
}
