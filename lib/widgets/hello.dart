import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          child: Text('Hello in Mokhtabary',
              style: GoogleFonts.pacifico(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber)),
        ),
      ],
    );
  }
}
