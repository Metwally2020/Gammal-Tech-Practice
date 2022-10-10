import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:gammal_tech_practice/screens/widgets/choise_button.dart';
import 'package:gammal_tech_practice/services/auth.dart';
import 'package:gammal_tech_practice/services/data_models.dart';

import '../shared/widgets/loader.dart';
import 'about.dart';
import 'check_answer.dart';
import 'quiz_screen.dart';


// ignore: must_be_immutable
class CountdownWidget extends StatefulWidget {
  final int practiceNum;
  final int maxPracticeNum;
  final int myPracticeType;

  final Practice myPractice;

  bool stopMyTimer = false;
  CountdownWidget({
    Key? key,
    required this.practiceNum,
    required this.maxPracticeNum,
    required this.myPracticeType,
    required this.myPractice,
  }) : super(key: key);

  @override
  State<CountdownWidget> createState() =>
      _CountdownWidgetState(stopMyTimer: stopMyTimer);
}

class _CountdownWidgetState extends State<CountdownWidget> {
  late Timer timer;
  int countdown = 10;
  bool stopMyTimer;
  _CountdownWidgetState({required this.stopMyTimer});
  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (stopMyTimer == false) {
        if (countdown > 0) {
          if (mounted) {
            setState(() {
              countdown--;
            });
          }
        } else {
          stopTimer();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => CheckAnswer(
                check: false,
                practiceNum: widget.practiceNum,
                maxPracticeNum: widget.maxPracticeNum,
                type: widget.myPracticeType,
              ),
            ),
          // ignore: argument_type_not_assignable_to_error_handler
          ).then((value) => null).catchError(() {});
        }
      } else {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    timer.cancel();
  }

  @override
  void initState() {
    countdown = widget.myPracticeType == 1 ? 10 : 15;
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Text(countdown.toString());
  }
}

class PracticeScreen extends StatefulWidget {

  final int practiceNum;
  final int maxPracticeNum;
  final int myPracticeType;
  final Practice myPractice;
  final CachedNetworkImage practiceImage;
  final String imageUrl;
  const PracticeScreen({
    Key? key,
    required this.practiceNum,
    required this.imageUrl,
    required this.practiceImage,
    required this.maxPracticeNum,
    required this.myPracticeType,
    required this.myPractice,
  }) : super(key: key);

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  User? currentUser = AuthService().currerntuser;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => loadData());
  }

  bool isLoading = true;

  Future loadData() async {
    setState(() => isLoading = true);

    await cacheImage(context, widget.imageUrl);

    setState(() => isLoading = false);
  }

  Future cacheImage(BuildContext context, String url) async =>
      precacheImage(CachedNetworkImageProvider(url), context);

  Widget buildImage(String url) => Image(
        image: CachedNetworkImageProvider(
          url,
        ),
      );

  @override
  Widget build(BuildContext context) {
    CountdownWidget myTimer = CountdownWidget(
      practiceNum: widget.practiceNum,
      maxPracticeNum: widget.maxPracticeNum,
      myPracticeType: widget.myPracticeType,
      myPractice: widget.myPractice,
    );
    return isLoading == false
        ? WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
                key: scaffoldKey,
                appBar: AppBar(
                  backgroundColor: Colors.teal,
                  title: myTimer,
                  elevation: 0,
                  actions: [
                    IconButton(
                      icon: Image.asset(
                        'assets/gammal tech.png',
                      ),
                      onPressed: () {
                        myTimer.stopMyTimer = true;
                        Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AboutScreen()))
                            .then((value) => null)
                            // ignore: argument_type_not_assignable_to_error_handler
                            .catchError(() {});
                      },
                    )
                  ],
                ),
                body: Container(
                    color: Colors.teal,
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height,
                    ),
                    child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(children: [
                          const SizedBox(
                            height: 20,
                          ),
                          buildImage(widget.imageUrl),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: Center(
                                child: Text(
                              'What is the Error ?',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  wordSpacing: 2,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ChoiceButton(
                            onTap: () {
                              myTimer.stopMyTimer = true;
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QuizScreen(
                                      practiceNum: widget.practiceNum,
                                      maxPracticeNum: widget.maxPracticeNum,
                                      type: widget.myPracticeType,
                                      myPractice: widget.myPractice,
                                    ),
                                  // ignore: argument_type_not_assignable_to_error_handler
                                  )).then((value) => null).catchError(() {});
                            },
                          )
                        ])))))
        : LoadingScreen();
  }
}

