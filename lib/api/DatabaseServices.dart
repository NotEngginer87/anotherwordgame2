// ignore_for_file: file_names, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static CollectionReference userdata = firestore.collection('user');
  static CollectionReference words = firestore.collection('words');
  static CollectionReference console = firestore.collection('console');

  static Future<void> updateakun(
      String? email,
      String nama,
      String gender,
      String? tanggal,
      String? bulan,
      String? tahun,
      String alamat,
      String noHP,
      String? imageUrl) async {
    await userdata.doc(email).set(
      {
        'email': email,
        'nama': nama,
        'gender': gender,
        'tanggal': tanggal,
        'bulan': bulan,
        'tahun': tahun,
        'alamat': alamat,
        'noHP': noHP,
        'imageurl': imageUrl,
      },
    );
  }

  static Future<void> setFAQ(String email, int n) async {
    await userdata
        .doc(email.toString())
        .collection('FAQ')
        .doc(n.toString())
        .set(
      {
        'expand': false,
        'id': n,
      },
    );
  }

}
