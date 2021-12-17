// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mokhtabary/Language/generated/key-lang.dart';
import 'package:mokhtabary/widgets/hello.dart';
import 'package:mokhtabary/widgets/my_button.dart';
import 'package:mokhtabary/widgets/rigester_button.dart';

class LoginScreen extends StatefulWidget {
  static const String screenRoute = 'LoginScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // ignore: unused_field
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool isPassword = true;
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const HelloScreen(),
              RigsterButton(
                titlle: 'Enter youe Email',
                bord: TextInputType.emailAddress,
                icon: const Icon(Icons.email),
                onEmpty: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Your Email';
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
                onsubmit: (value) {},
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
                tittle: 'Login',
                color: Colors.blue,
                onPressed: () async {
                  if (formkey.currentState!.validate()) {}
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
