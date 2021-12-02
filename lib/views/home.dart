import 'package:flutter/material.dart';
import 'package:mokhtabary/theme/app_color.dart';
import 'package:mokhtabary/views/afterlogin_screen.dart';
import 'package:mokhtabary/views/rigester_screen.dart';

import 'package:mokhtabary/widgets/hello.dart';
import 'package:mokhtabary/widgets/my_button.dart';

class PageHome extends StatefulWidget {
  static const String screenRoute = 'home_screen';
  const PageHome({Key? key}) : super(key: key);

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mokhatbary'),
        centerTitle: true,
        backgroundColor: Colors.orange[700],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const HelloScreen(),
            const SizedBox(
              height: 30,
            ),
            Mybuuton(
                tittle: 'Log in',
                color: AppColor.maincolor,
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.screenRoute);
                }),
            Mybuuton(
                tittle: 'Rigster',
                color: Colors.indigo,
                onPressed: () {
                  Navigator.pushNamed(context, Rigsteraition.screenRoute);
                })
          ],
        ),
      ),
    );
  }
}
