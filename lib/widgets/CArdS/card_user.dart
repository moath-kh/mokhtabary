// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mokhtabary/Language/generated/key-lang.dart';

// ignore: must_be_immutable
class CardUser extends StatelessWidget {
  CardUser({
    required this.tittle,
    required this.image,
    this.cardClick,
    Key? key,
  }) : super(key: key);
  final String tittle;
  final String image;
  void Function()? cardClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: InkWell(
        onTap: cardClick,
        child: Card(
          elevation: 10,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              // * Image
              Expanded(
                flex: 4,
                child: Image(
                  fit: BoxFit.fitHeight,
                  image: AssetImage(image),
                ),
              ),
              // * Title
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Text(
                    KeyLang.date.tr() + '  10/12',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w900),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        tittle,
                        style: GoogleFonts.aBeeZee(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
