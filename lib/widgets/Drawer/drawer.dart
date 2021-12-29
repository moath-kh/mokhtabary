// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mokhtabary/Language/generated/key-lang.dart';
import 'package:mokhtabary/utils/path_image.dart';
import 'package:mokhtabary/views/about_screen.dart';
import 'package:mokhtabary/views/home.dart';
import 'package:mokhtabary/views/navigation_page.dart';
import 'custome_list.dart';
import 'alert_lang.dart';

class ComponentDrawer extends StatelessWidget {
  const ComponentDrawer({Key? key, this.name}) : super(key: key);
  final String? name;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final _auth = FirebaseAuth.instance;

    return Row(
      children: [
        Drawer(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(39.0),
                child: Container(
                  width: 150,
                  height: 150,
                  margin: const EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                      color: Colors.amber[200],
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                          image: AssetImage(PathImage.mokhtabary),
                          fit: BoxFit.cover)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text('',
                  style: GoogleFonts.pacifico(
                      color: Colors.amber[600],
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              const SizedBox(
                height: 20,
              ),
              Divider(
                height: 20,
                color: Colors.black.withOpacity(0.5),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomeTitle(
                title: KeyLang.home.tr(),
                icon: (Icons.home),
                onClick: () {
                  Navigator.pushReplacementNamed(
                      context, NavScreen.screenRoute);
                },
              ),
              CustomeTitle(
                title: KeyLang.language.tr(),
                icon: Icons.language,
                onClick: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return const ALertDialogDrawer();
                    },
                  );
                },
              ),
              CustomeTitle(
                title: KeyLang.type.tr(),
                icon: Icons.help,
                onClick: () {
                  Navigator.pushNamed(context, AboutScreen.screenRoute);
                },
              ),
              CustomeTitle(
                title: KeyLang.logout.tr(),
                icon: Icons.logout,
                color: Colors.red,
                onClick: () {
                  _auth.signOut();
                  Navigator.pushReplacementNamed(context, PageHome.screenRoute);
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
