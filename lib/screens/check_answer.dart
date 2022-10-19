import 'package:flutter/material.dart';
import 'package:gammal_tech_practice/screens/reload_practice.dart';

import '../shared/widgets/loader.dart';
import 'about.dart';
import 'load_the_practice.dart';

// TODO: navigation glitches, back button glitches

// ignore: must_be_immutable
class CheckAnswer extends StatelessWidget {
  CheckAnswer(
      {super.key,
      required this.type,
      required this.check,
      required this.practiceNum,
      required this.maxPracticeNum});
  bool check;
  int type;
  int practiceNum;
  int maxPracticeNum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          // TODO: why use a builder?
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed('/home')
                    .then((value) => null)
                    // ignore: argument_type_not_assignable_to_error_handler
                    .catchError(() {});
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Text(
          check == true ? 'Correct Answer' : 'Wrong Answer',
        ),
        actions: [
          IconButton(
            // TODO: save this icon button and reuse it in other AppBars
            icon: Image.asset('assets/gammal tech.png'),
            onPressed: () {
              Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutScreen()))
                  .then((value) => null)
                  // ignore: argument_type_not_assignable_to_error_handler
                  .catchError(() {});
            },
          )
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Image.asset(
                // TODO: i love gifs, but the sad (wrong answer) ones might come off to harsh (instead of friendly)
                type == 1
                    ? check == false
                        ? 'assets/easy_sad.gif'
                        : 'assets/easy_happy.gif'
                    : check == false
                        ? 'assets/hard_sad.gif'
                        : 'assets/hard_happy.gif',
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return LoadingScreen();
                },
              ),
              const SizedBox(
                height: 60,
              ),
              InkWell(
                onTap: () {
                  practiceNum < maxPracticeNum - 1
                      ? check == false
                          ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoadThePractice(
                                            type: type,
                                            practiceNum: practiceNum + 1,
                                          )))
                              .then((value) => null)
                              // ignore: argument_type_not_assignable_to_error_handler
                              .catchError(() {})
                          : Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoadThePractice(
                                            type: type,
                                            practiceNum: practiceNum,
                                          )))
                              .then((value) => null)
                              // ignore: argument_type_not_assignable_to_error_handler
                              .catchError(() {})
                      : check == false
                          ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoadThePractice(
                                            type: type,
                                            practiceNum: practiceNum,
                                          )))
                              .then((value) => null)
                              // ignore: argument_type_not_assignable_to_error_handler
                              .catchError(() {})
                          : maxPracticeNum == 0
                              ? Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ReloadPractice(
                                                type: type,
                                              )))
                                  .then((value) => null)
                                  // ignore: argument_type_not_assignable_to_error_handler
                                  .catchError(() {})
                              : Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoadThePractice(
                                                type: type,
                                                practiceNum: 0,
                                              )))
                                  .then((value) => null)
                                  // ignore: argument_type_not_assignable_to_error_handler
                                  .catchError(() {});
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Center(
                    child: Text(
                      'Next Challenge',
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
              check == false
                  ? InkWell(
                      onTap: () {
                        practiceNum < maxPracticeNum
                            ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoadThePractice(
                                              type: type,
                                              practiceNum: practiceNum,
                                            )))
                                .then((value) => null)
                                // ignore: argument_type_not_assignable_to_error_handler
                                .catchError(() {})
                            : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ReloadPractice(
                                              type: type,
                                            )))
                                .then((value) => null)
                                // ignore: argument_type_not_assignable_to_error_handler
                                .catchError(() {});
                      },
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1.5,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Center(
                          child: Text(
                            'Repeat The Challenge',
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
                    )
                  : SizedBox(
                      height: 0,
                      width: 0,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
