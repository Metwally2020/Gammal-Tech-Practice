import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firestore.dart';

class AuthService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  User? Currerntuser = FirebaseAuth.instance.currentUser;

  Future<void> anonLogin({context}) async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously().
      then((value) {
        FirestoreService().addUser(userId: value.user!.uid);
        return Navigator.of(context).pushReplacementNamed('/home');
      }
      );
      print("Signed in with temporary account.");
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
    }
  }
  Future<void> signOut()async{
    await FirebaseAuth.instance.signOut();
  }
}
