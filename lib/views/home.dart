// ignore: implementation_imports
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mokhtabary/Language/generated/key-lang.dart';
// ignore: unused_import
import 'package:mokhtabary/services/auth.dart';
import 'package:mokhtabary/views/controller/auth.dart';
import 'package:mokhtabary/views/navigation_page.dart';
import 'package:mokhtabary/views/navlap.dart';
import 'package:mokhtabary/views/rigester_screen.dart';
import 'package:mokhtabary/widgets/hello.dart';
// ignore: unused_import
import 'package:mokhtabary/widgets/loading.dart';
import 'package:mokhtabary/widgets/my_button.dart';
import 'package:mokhtabary/widgets/rigester_button.dart';
import 'package:provider/provider.dart';

class PageHome extends StatefulWidget {
  static const String screenRoute = 'home_screen';
  const PageHome({Key? key}) : super(key: key);
  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  // ignore: unused_field
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // final Autthservic _authh = Autthservic();
  late String email;
  late String password;
  String error = '';
  bool isPassword = true;
  // bool loading = false;

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
              //Button Login
              Mybuuton(
                tittle: KeyLang.login.tr(),
                color: Colors.orange[700]!,
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    setState(() {
                      // loading = true;
                    });
                    try {
                      _auth
                          .signInWithEmailAndPassword(
                        email: email.trim(),
                        password: password.trim(),
                      )
                          .then((value) {
                        // ignore: avoid_print
                        print(
                            'our user is  ====================== ${value.user!.uid}');
                        FirebaseFirestore.instance
                            .collection('patint')
                            .doc(value.user!.uid.toString())
                            .get()
                            .then((value) {
                            Future.delayed(const Duration(milliseconds: 200), () {
                            Provider.of<AuthState>(context, listen: false)
                                .updateUser(value.data());
                          });
                          if (value.data()!['rules'] == 'user') {
                            setState(() {
                              Fluttertoast.showToast(
                                  msg: "Signed In Sucessfully");
                              Navigator.pushReplacementNamed(
                                  context, NavScreen.screenRoute);
                            });
                          } else if (value.data()!['rules'] == 'admin') {
                            setState(() {
                              Fluttertoast.showToast(
                                  msg: "Signed In Sucessfully");
                              Navigator.pushReplacementNamed(
                                  context, NAvLApScreen.screenRoute);
                            });
                          }
                          // ignore: avoid_print
                          print(value.data());
                        });
                      });
                    } catch (e) {
                      setState(() {
                        // ignore: avoid_print
                        print(e.toString());
                        Fluttertoast.showToast(
                            msg: KeyLang.wrong.tr(),
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        // loading = false;
                      });
                    }
                  }
                },
              ),
              //Button Rigster
              Mybuuton(
                  tittle: KeyLang.rigst.tr(),
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.pushNamed(context, Rigsteraition.screenRoute);
                  }),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*   try {
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
                    }*/

/*async {
                  if (formkey.currentState!.validate()) {
                    try {
                      dynamic newUSer =
                          await _auth.createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      // ignore: unnecessary_null_comparison
                      if (newUSer == null) {
                        setState(() => error = 'oanpodinapvnakm');
                      }
                      Navigator.pushReplacementNamed(
                          context, NavScreen.screenRoute);
                    } catch (e) {
                      // ignore: avoid_print
                      print(e.toString());
                    }
                  }
                }, */

/*async {
                  if (formkey.currentState!.validate()) {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: email, password: password)
                        .then((value) {
                      print(email);
                      print(password);
                    }).catchError((error) {
                      Text(
                        error,
                        style: const TextStyle(color: Colors.red, fontSize: 20),
                      );
                    });
                  }
                }, */

/*
                 try {
                      dynamic newUSer = await _auth.signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      // ignore: unnecessary_null_comparison
                      if (newUSer == null) {
                        setState(() => error = 'oanpodinapvnakm');
                      }
                      Navigator.pushReplacementNamed(
                          context, NavScreen.screenRoute);
                    } catch (e) {
                      // ignore: avoid_print
                      print(e.toString());
                    } */
