import 'package:anotherwordgame2/app/wordwidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class anotherwordgame extends StatefulWidget {
  const anotherwordgame({Key? key}) : super(key: key);

  @override
  State<anotherwordgame> createState() => _anotherwordgameState();
}

class _anotherwordgameState extends State<anotherwordgame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('game'),
      ),
      body: Center(
        child: Column(
          children: [
            StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('words')
                  .doc('2')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Map<String, dynamic> data =
                      snapshot.data!.data() as Map<String, dynamic>;

                  int id = data['id'];
                  int long = data['long'];
                  String word = data['word'];

                  return wordwidget(id,long,word);
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
