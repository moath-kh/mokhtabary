// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mokhtabary/Language/generated/key-lang.dart';
import 'package:mokhtabary/views/navigation_page.dart';
import 'package:mokhtabary/widgets/hello.dart';
import 'package:mokhtabary/widgets/my_button.dart';
import 'package:mokhtabary/widgets/rigester_button.dart';

class Rigsteraition extends StatefulWidget {
  static const String screenRoute = 'rigsterscreen';
  const Rigsteraition({Key? key}) : super(key: key);

  @override
  _RigsteraitionState createState() => _RigsteraitionState();
}

class _RigsteraitionState extends State<Rigsteraition> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  late String phone;
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
              const SizedBox(
                height: 10,
              ),
              RigsterButton(
                titlle: KeyLang.email.tr(),
                onEmpty: (value) {
                  if (value!.isEmpty) {
                    return KeyLang.pemail.tr();
                  }
                  return null;
                },
                icon: const Icon(Icons.email),
                onClick: (value) {
                  email = value;
                },
              ),
              RigsterButton(
                titlle: 'Number Phone',
                icon: const Icon(
                  Icons.phone,
                ),
                bord: TextInputType.phone,
                onEmpty: (value) {},
                onClick: (value) {
                  phone = value;
                },
              ),
              RigsterButton(
                bord: TextInputType.text,
                titlle: KeyLang.pass.tr(),
                icon: const Icon(Icons.lock),
                scure: isPassword,
                sicon: isPassword ? Icons.visibility : Icons.visibility_off,
                suFF: () {
                  setState(() {
                    isPassword = !isPassword;
                  });
                },
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
                tittle: KeyLang.rigst.tr(),
                color: Colors.blue,
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    try {
                      // ignore: unused_local_variable
                      final newUSer =
                          await _auth.createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      Navigator.pushReplacementNamed(
                          context, NavScreen.screenRoute);
                    } catch (e) {
                      // ignore: avoid_print
                      print(e);
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
/*
            onClick: (value) {
              email = value;
            },
            
            onClick: (value) {
              phone = value;
            },
             onClick: (value) {
              password = value;
            },


             print(email);
              print(phone);
              print(password);
            
            */ 