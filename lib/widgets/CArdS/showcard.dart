import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowCard extends StatelessWidget {
  final IconData icon;
  final String name;
  final String title;
  const ShowCard({
    Key? key,
    required this.icon,
    required this.name,
    required this.title,
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
              Text(
                name + '  :',
                style: GoogleFonts.actor(
                  color: Colors.orange,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: GoogleFonts.aBeeZee(
                  color: Colors.red,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
          // leading: Icon(Icons.car_repair_rounded),
          trailing: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(
              icon,
              color: Colors.amber,
            ),
          ),
        ),
      ),
    );
  }
}
