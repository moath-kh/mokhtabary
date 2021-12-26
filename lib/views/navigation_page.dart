import 'package:flutter/material.dart';
import 'package:mokhtabary/views/patient_screen.dart';
import 'package:mokhtabary/views/drawer_screen.dart';
import 'package:mokhtabary/widgets/custome_nav.dart';

class NavScreen extends StatefulWidget {
  static const String screenRoute = 'NavigationScreen';
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int index = 0;
  final List<Widget> _pages = const [
    PatientSCreen(),
    ChatScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[index],
      bottomNavigationBar: CustomNavigationbar(
        index: index,
        onClick: (value) {
          setState(() {
            index = value;
            //
          });
        },
      ),
    );
  }
}
