// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mokhtabary/Language/generated/key-lang.dart';
import 'package:mokhtabary/views/navigation_page.dart';
import 'package:mokhtabary/views/rigester_screen.dart';
import 'package:mokhtabary/widgets/hello.dart';
import 'package:mokhtabary/widgets/my_button.dart';
import 'package:mokhtabary/widgets/rigester_button.dart';

class PageHome extends StatefulWidget {
  static const String screenRoute = 'home_screen';
  const PageHome({Key? key}) : super(key: key);
  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  // ignore: unused_field
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool isPassword = true;
  var formkey = GlobalKey<FormState>();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(KeyLang.appName.tr()),
        centerTitle: true,
        backgroundColor: Colors.orange[700],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const HelloScreen(),
              const SizedBox(
                height: 30,
              ),
              RigsterButton(
                titlle: KeyLang.email.tr(),
                bord: TextInputType.emailAddress,
                icon: const Icon(Icons.email),
                onEmpty: (value) {
                  if (value!.isEmpty) {
                    return KeyLang.pemail.tr();
                  }
                  return null;
                },
                onClick: (value) {
                  email = value;
                },
              ),
              RigsterButton(
                titlle: KeyLang.pass.tr(),
                icon: const Icon(Icons.lock),
                sicon: isPassword ? Icons.visibility : Icons.visibility_off,
                suFF: () {
                  setState(() {
                    isPassword = !isPassword;
                  });
                },
                bord: TextInputType.visiblePassword,
                scure: isPassword,
                onEmpty: (value) {
                  if (value!.isEmpty) {
                    return KeyLang.ppass.tr();
                  }
                  return null;
                },
                onClick: (value) {
                  password = value;
                },
              ),
              Mybuuton(
                tittle: KeyLang.login.tr(),
                color: Colors.orange[700]!,
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    try {
                      final user = _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      // ignore: unnecessary_null_comparison
                      if (user != null) {
                        Navigator.pushReplacementNamed(
                            context, NavScreen.screenRoute);
                      }
                    } catch (e) {
                      // ignore: avoid_print
                      print(e);
                    }
                  }
                },
              ),
              /*   Mybuuton(
                  tittle: 'Log in',
                  color: Colors.orange,
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.screenRoute);
                  }),*/
              Mybuuton(
                  tittle: KeyLang.rigst.tr(),
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.pushNamed(context, Rigsteraition.screenRoute);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
