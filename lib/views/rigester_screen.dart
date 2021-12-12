// ignore: implementation_imports
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mokhtabary/Language/generated/key-lang.dart';
import 'package:mokhtabary/models/rigst_model.dart';
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
  //final Autthservic _auth = Autthservic();
  late String email;
  late String password;
  late String phone;
  late String name;
  late String uid;
  String error = '';
  bool isPassword = true;
  // ignore: non_constant_identifier_names
  void Usercreate({
    required String phone,
    required String name,
    required String email,
  }) {
    name;
    phone;
    email;
    RigstModel model = RigstModel(
      name,
      email,
      phone,
      uid,
    );
    FirebaseFirestore.instance.collection('user').doc(phone).set(
          model.toMap(),
        );
  }

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
              //Name
              RigsterButton(
                onClick: (value) {
                  name = value;
                },
                bord: TextInputType.name,
                onEmpty: (value) {
                  if (value!.isEmpty) {
                    return KeyLang.pusername.tr();
                  }
                  return null;
                },
                titlle: KeyLang.username.tr(),
                icon: const Icon(Icons.people),
              ),
              //Email
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
              //Phone
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
              //Password
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
                onEmpty: (value) =>
                    value!.length < 6 ? KeyLang.epass.tr() : null,
                onClick: (value) {
                  password = value;
                },
              ),
              Mybuuton(
                tittle: KeyLang.rigst.tr(),
                color: Colors.blue,
                onPressed: () async {
                  if (formkey.currentState!.validate()) {}
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
                },
              ),
              const SizedBox(height: 20),

              Text(
                error,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 50,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
/*
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
            
            */ 


/* 
  dynamic newUSer = await _auth
                        .createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    )
                        .then((value) {
                      Usercreate(phone: phone, name: name, email: email);
                    }).catchError((e) {
                      // ignore: avoid_print
                      print(e);
                    });
                    // ignore: unnecessary_null_comparison
                    if (newUSer == null) {
                      setState(() => error = 'oanpodinapvnakm');
                    }

                    Navigator.pushReplacementNamed(
                        context, NavScreen.screenRoute);
                  */

                  /*
                  .then((value) {})
        .catchError((error) {
      // ignore: avoid_print
      print(error);
    }) */

    /*  */