import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gammal_tech_practice/services/firestore.dart';

import '../services/auth.dart';
import '../services/data_models.dart';
import '../shared/widgets/loader.dart';

class ReloadPractice extends StatelessWidget {
  ReloadPractice({super.key, required this.type});
  int type;
  List<String> myPracticesIds = [];
  User? currentUser = AuthService().Currerntuser;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Practice>>(
      future: FirestoreService().getPractice(type: type),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else if (snapshot.hasError) {
          return Center(
            child: Dialog(
              child: Text(snapshot.error.toString()),
            ),
          );
        } else if (snapshot.hasData) {
          for (var prac in snapshot.data!) {
            myPracticesIds.add(prac.practiceId);
          }

          return Scaffold(
            appBar: AppBar(elevation: 0),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Congratulations!',
                      style: TextStyle(
                          wordSpacing: 1.5,
                          height: 1.5,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'You have finished your practice for the final exam',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          wordSpacing: 1.5,
                          height: 1.5,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () {
                        FirestoreService().updateallPracticeWhenFinished(
                            practicesIds: myPracticesIds,
                            type: type,
                            uid: currentUser!.uid);
                        Navigator.of(context).pushReplacementNamed('/home');
                      },
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1.5,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Center(
                          child: Text(
                            'Reload Solved Practice',
                            style: TextStyle(
                                wordSpacing: 1.5,
                                height: 1.5,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed('/home');
                      },
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1.5,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Center(
                          child: Text(
                            'Go to Home Page',
                            style: TextStyle(
                                wordSpacing: 1.5,
                                height: 1.5,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          );
        } else {
          return const Center(
              child: Dialog(
            child: Text('No courses found in Firestore. Check database'),
          ));
        }
      },
    );
  }
}
