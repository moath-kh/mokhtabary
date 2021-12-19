import 'package:flutter/material.dart';
import 'package:mokhtabary/views/laps_creen.dart';
import 'package:mokhtabary/views/chat_screen.dart';
import 'package:mokhtabary/widgets/custome_nav.dart';

class NAvLApScreen extends StatefulWidget {
  static const String screenRoute = 'NavigationScreen';
  const NAvLApScreen({Key? key}) : super(key: key);

  @override
  State<NAvLApScreen> createState() => _NAvLApScreenState();
}

class _NAvLApScreenState extends State<NAvLApScreen> {
  int index = 0;
  final List<Widget> _pages = const [
    LapSCreen(),
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
