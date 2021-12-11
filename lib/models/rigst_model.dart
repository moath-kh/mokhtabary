// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';

class RigstModel {
  late final String name;
  late final String email;
  late final String phone;
  late final String uid;
  RigstModel(
    this.name,
    this.email,
    this.phone,
    this.uid,
  );
  RigstModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    uid = json['uid'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uid': uid,
    };
  }
}
