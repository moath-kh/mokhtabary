import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mokhtabary/views/home.dart';
import 'package:mokhtabary/views/navigation_page.dart';
import 'package:mokhtabary/widgets/hello.dart';

class PageSplash extends StatefulWidget {
  static const String id = 'PageSplash';

  const PageSplash({Key? key}) : super(key: key);

  @override
  _PageSplashState createState() => _PageSplashState();
}

class _PageSplashState extends State<PageSplash> {
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      // var route = MaterialPageRoute(builder: (context) => PageHome());
      // Navigator.push(context, route);
      // Navigator.pushNamed(context, PageHome.id);
      Navigator.pushReplacementNamed(
          context,
          _auth.currentUser != null
              ? NavScreen.screenRoute
              : PageHome.screenRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          HelloScreen(),
          SizedBox(height: 10),
        ],
      )),
    );
  }
}
