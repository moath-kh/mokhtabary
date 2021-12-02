import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardLap extends StatelessWidget {
  const CardLap({Key? key, required this.namelap, required this.imagelap})
      : super(key: key);
  final String namelap;
  final String imagelap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 5,
        color: Colors.black,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          title: Text(
            namelap,
            style: GoogleFonts.robotoSlab(
                fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          trailing: Image(
            image: AssetImage(imagelap),
            fit: BoxFit.cover,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}
