import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custome_list.dart';

class ComponentDrawer extends StatelessWidget {
  const ComponentDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: 150,
            height: 150,
            margin: const EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
              color: Colors.amber[200],
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Text('Name User',
              style: GoogleFonts.pacifico(
                  color: Colors.amber[600],
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          const SizedBox(
            height: 50,
          ),
          Divider(
            height: 20,
            color: Colors.black.withOpacity(0.5),
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomeTitle(title: 'Home', icon: (Icons.home)),
          const CustomeTitle(title: 'Setting', icon: Icons.settings),
          const CustomeTitle(title: "About", icon: Icons.help)
        ],
      ),
    );
  }
}
