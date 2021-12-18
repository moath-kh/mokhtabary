// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService {
  late final String uid;
  DataBaseService({required this.uid});
  // collection refrances
  final CollectionReference patintCollection =
      FirebaseFirestore.instance.collection('patint');

  Future UpdateUserData(String phone, String name, String email) async {
    return await patintCollection.doc(uid).set({
      'phone': phone,
      'name': name,
      'email': email,
      'rules': 'user',
    });
  }

// get patint stream
  Stream<QuerySnapshot> get patint {
    return patintCollection.snapshots();
  }
}
