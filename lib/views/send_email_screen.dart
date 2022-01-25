import 'dart:convert';

import 'package:http/http.dart' as http;
// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mokhtabary/Language/generated/key-lang.dart';
import 'package:mokhtabary/widgets/Button/my_button.dart';

class EmailScreen extends StatefulWidget {
  static const String screenRoute = 'emailscreen';
  const EmailScreen({Key? key}) : super(key: key);

  @override
  _EmailScreenState createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final controllerTO = TextEditingController();
  final controllerSu = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllermesseage = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber[900],
          title: Text(
            KeyLang.appName.tr(),
            style: GoogleFonts.sora(color: Colors.yellowAccent),
          ),
          centerTitle: true,
          elevation: 2,
          //  leading: ,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                buildtextfaild(tittle: 'Name', controller: controllerTO),
                const SizedBox(height: 16),
                buildtextfaild(tittle: 'Email', controller: controllerEmail),
                const SizedBox(height: 16),
                buildtextfaild(tittle: 'Subject', controller: controllerSu),
                const SizedBox(height: 16),
                buildtextfaild(
                    tittle: 'Message',
                    controller: controllermesseage,
                    maxlines: 8),
                const SizedBox(
                  height: 16,
                ),
                Mybuuton(
                    tittle: KeyLang.send.tr(),
                    color: Colors.blue,
                    onPressed: () {
                      LaunchEmail(
                        name: controllerTO.text,
                        email: controllerEmail.text,
                        subject: controllerSu.text,
                        message: controllermesseage.text,
                      );
                    }),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ));
  }
}

// ignore: non_constant_identifier_names
Future LaunchEmail({
  required String email,
  required String name,
  required String subject,
  required String message,
}) async {
  const serviceid = 'service_uyqj2su';
  const templetid = 'template_ot4k0ht';
  const userid = 'user_ieApWfyzX8IcusKCXSPaJ';
  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  final response = await http.post(url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json'
      },
      body: json.encode({
        'service_id': serviceid,
        'template_id': templetid,
        'user_id': userid,
        'template_params': {
          'user_name': name,
          'user_email': email,
          'to_email': 'other.email@gmail.com',
          'user_subject': subject,
          'user_message': message,
        }
      }));
  // ignore: avoid_print
  print(response.body);
}

Widget buildtextfaild({
  required String tittle,
  required TextEditingController controller,
  int maxlines = 1,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tittle,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: controller,
          maxLines: maxlines,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0))),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                borderSide: BorderSide(color: Colors.orange, width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                borderSide: BorderSide(color: Colors.blue, width: 2)),
          ),
        )
      ],
    );
