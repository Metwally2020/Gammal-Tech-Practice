import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gammal_tech_practice/screens/practice.dart';
import 'package:gammal_tech_practice/services/auth.dart';
import 'package:gammal_tech_practice/services/data_models.dart';

import '../services/firestore.dart';
import '../shared/widgets/loader.dart';
import 'about.dart';
import 'reload_practice.dart';

// ignore: must_be_immutable
class LoadThePractice extends StatefulWidget {
  LoadThePractice({super.key, required this.type, required this.practiceNum});

  int type;

  int practiceNum;

  @override
  State<LoadThePractice> createState() => _LoadThePracticeState();
}

class _LoadThePracticeState extends State<LoadThePractice> {
  User? currentUser = AuthService().currerntuser;

  List<Practice> myPractices = [];

  @override
  void initState() {
    super.initState();
  }

  bool isLoading = true;
  late CachedNetworkImage practiceImage;
  void setImage({mycontext, url}) {
    practiceImage = CachedNetworkImage(
      imageUrl: url,
      errorWidget: (context, url, error) => LoadingScreen(),
      progressIndicatorBuilder: (context, url, isDounlad) {
        if (isDounlad.downloaded == 1) {
          setState(() {
            isLoading = false;
          });
        }
        return LoadingScreen();
      },
      width: MediaQuery.of(mycontext).size.width,
      height: 200,
      fit: BoxFit.contain,
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Practice>>(
      future: FirestoreService().getPractice(type: widget.type),
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
            if (prac.solvedBy.contains(currentUser!.uid)) {
              continue;
            } else {
              myPractices.add(prac);
            }
          }
          if (myPractices.isEmpty) {
            return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReloadPractice(
                                  type: widget.type,
                                // ignore: argument_type_not_assignable_to_error_handler
                                ))).then((value) => null).catchError(() {});
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Center(
                      child: Text(
                        'Reload Practice',
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
              ),
            );
          } else {
            setImage(
                mycontext: context,
                url: myPractices[widget.practiceNum].practiceUrl);

            return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.teal,
                  title: Text('Start Practice'),
                  actions: [
                    IconButton(
                      icon: Image.asset(
                        'assets/gammal tech.png',
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AboutScreen()));
                      },
                    )
                  ],
                  elevation: 0,
                ),
                body: Container(
                    color: Colors.teal,
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height,
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PracticeScreen(
                                imageUrl:
                                    myPractices[widget.practiceNum].practiceUrl,
                                myPractice: myPractices[widget.practiceNum],
                                practiceNum: widget.practiceNum,
                                maxPracticeNum: myPractices.length,
                                myPracticeType: widget.type,
                                practiceImage: practiceImage,
                              ),
                            ),
                          // ignore: argument_type_not_assignable_to_error_handler
                          ).then((value) => null).catchError(() {});
                        },
                        child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width / 1.5,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Center(
                            child: Text(
                              'Start Practice',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    )));
          }
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
