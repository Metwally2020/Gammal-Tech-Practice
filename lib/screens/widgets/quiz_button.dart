import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gammal_tech_practice/services/data_models.dart';
import 'package:gammal_tech_practice/services/firestore.dart';

import '../../services/auth.dart';
import '../check_answer.dart';

// ignore: must_be_immutable
class QuizButton extends StatelessWidget {
  Practice myPractice;
  int index;
  int practiceNum;
  int maxPracticeNum;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  QuizButton({
    super.key,
    required this.index,
    required this.practiceNum,
    required this.maxPracticeNum,
    required this.myPractice,
  });

  User? currentUser = AuthService().currerntuser;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        myPractice.quizAnswer == index + 1
            ? {
                FirestoreService().updatePracticeWhenSolved(
                    uid: currentUser!.uid, practice: myPractice),
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CheckAnswer(
                              check: true,
                              practiceNum: practiceNum,
                              maxPracticeNum: maxPracticeNum,
                              type: myPractice.type,
                            // ignore: argument_type_not_assignable_to_error_handler
                            ))).then((value) => null).catchError((){}),
              }
            : {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CheckAnswer(
                              check: false,
                              practiceNum: practiceNum,
                              maxPracticeNum: maxPracticeNum,
                              type: myPractice.type,
                            // ignore: argument_type_not_assignable_to_error_handler
                            ))).then((value) => null).catchError((){}),
              };
      },
      child: Container(
        height: 40,
        constraints: const BoxConstraints(
          maxWidth: double.infinity,
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 4),
          child: Text(
            myPractice.quiz[index],
            style: TextStyle(
                wordSpacing: 1.5,
                height: 1.5,
                fontSize: 18,
                color: Colors.black),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}
