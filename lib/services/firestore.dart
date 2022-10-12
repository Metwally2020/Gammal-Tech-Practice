import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'auth.dart';
import 'data_models.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  String? path;
  CollectionReference? ref;
  var currentUser = AuthService().currerntuser;

  addUser({required userId, context}) async {
    ref = _db.collection('users');
    await ref!
        .doc(userId)
        .set(MyUser(
          uid: userId,
        ).toJson())
        .then((value) {})
        .catchError((error) {
      AwesomeDialog(
          showCloseIcon: true,
          context: context,
          title: 'Error',
          body: Text(
            'Failed to add The user: $error\n',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )).show();
    });
  }

  Future<void> updatePracticeWhenSolved(
      {required uid, required Practice practice}) async {
    _db.collection('practices').doc(practice.practiceId).update({
      'solvedBy': FieldValue.arrayUnion([uid])
    });
  }

  Future<void> updateallPracticeWhenFinished({
    required type,
    required List practicesIds,
    required uid,
  }) async {
    for (int i = 0; i < practicesIds.length; i++) {
      _db.collection('practices').doc(practicesIds[i]).update({
        'solvedBy': FieldValue.arrayRemove([uid])
      });
    }
  }


  Future<MyUser> getSingleUser({uid}) async {
    var docRef = _db.collection('lesson').doc(uid);
    var snapshot = await docRef.get();
    return MyUser.fromJson(snapshot.data() ?? {});
  }

  Future<List<Practice>> getPractice({
    required type,
  }) async {
    ref = _db.collection('practices');
    var snapshot = await ref!.where('type', isEqualTo: type).get();
    var data = snapshot.docs.map((e) => e.data());
    var practices =
        data.map((d) => Practice.fromJson(d as Map<String, dynamic>));
    return practices.toList();
  }

  addPractice({
    required type,
    required answer,
    required numcerOfLines,
    required quiz,
    required quizAnswer,
    required practiceUrl,
    required solvedBy,
    context,
  }) async {
    ref = _db.collection('Practice');
    await ref!
        .add(Practice(
      practiceUrl: practiceUrl,
      quiz: quiz,
      quizAnswer: quizAnswer,
      solvedBy: solvedBy,
      type: type,
    ).toJson())
        .then((value) {
      final addingExerxiseId = _db.collection('practices').doc(value.id);
      addingExerxiseId.update({'practiceId': value.id}).then((value) => () {},
          onError: (e) => () {});
    }).catchError((error) {
      AwesomeDialog(
          showCloseIcon: true,
          context: context,
          title: 'Error',
          body: Text(
            'Failed to add The Exercise: $error\n',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )).show();
    });
  }
}
