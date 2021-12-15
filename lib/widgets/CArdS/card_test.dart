import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardTest extends StatelessWidget {
  const CardTest({
    Key? key,
    required this.nametest,
    required this.onPassed,
  }) : super(key: key);
  final String nametest;
  final void Function()? onPassed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPassed,
      child: Card(
        elevation: 5,
        color: Colors.amber,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          title: Center(
            child: Text(
              nametest,
              style: GoogleFonts.aBeeZee(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 25),
            ),
          ),
          // trailing: Image(
          //   image: AssetImage(imagetest),
          //   fit: BoxFit.cover,
          //   height: double.infinity,
          // ),
        ),
      ),
    );
  }
}
