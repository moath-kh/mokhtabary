// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mokhtabary/Language/generated/key-lang.dart';

class DeliveryCard extends StatelessWidget {
  const DeliveryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4.0))),
        child: ListTile(
          title: Row(
            children: [
              Text(
                KeyLang.del.tr(),
                style: GoogleFonts.adamina(color: Colors.orange, fontSize: 22),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                '3 ' + KeyLang.jd.tr(),
                style: GoogleFonts.actor(
                  color: Colors.green,
                  fontSize: 20,
                ),
              )
            ],
          ),
          trailing: const Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(
              Icons.car_repair_rounded,
              color: Colors.amber,
            ),
          ),
        ),
      ),
    );
  }
}
