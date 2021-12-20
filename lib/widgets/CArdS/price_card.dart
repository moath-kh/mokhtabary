// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mokhtabary/Language/generated/key-lang.dart';
import 'package:mokhtabary/utils/path_image.dart';

class PriceCard extends StatelessWidget {
  const PriceCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4.0))),
        child: ListTile(
          title: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Text(
                KeyLang.price.tr(),
                style: GoogleFonts.adamina(color: Colors.orange, fontSize: 22),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                '10 ' + KeyLang.jd.tr(),
                style: GoogleFonts.actor(
                  color: Colors.green,
                  fontSize: 20,
                ),
              )
            ],
          ),
          // leading: Icon(Icons.car_repair_rounded),
          trailing: const Padding(
            padding: EdgeInsets.all(15.0),
            child: Image(
              image: AssetImage(PathImage.dollar),
            ),
          ),
        ),
      ),
    );
  }
}
