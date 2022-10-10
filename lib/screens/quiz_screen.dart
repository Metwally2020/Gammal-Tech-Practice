import 'package:flutter/material.dart';
import '../services/data_models.dart';
import 'widgets/quiz_button.dart';

// ignore: must_be_immutable
class QuizScreen extends StatelessWidget {
  QuizScreen(
      {super.key,
      required this.type,
      required this.myPractice,
      required this.practiceNum,
      required this.maxPracticeNum});
  bool check = false;
  int type;
  int practiceNum;
  Practice myPractice;
  int maxPracticeNum;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        
        body: SizedBox(
          
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  const Text(
                    'What is the error cause ?',
                    style: TextStyle(fontSize: 26, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      itemCount: myPractice.quiz.length,
                      itemBuilder: (context, index) => QuizButton(
                        index: index,
                        myPractice: myPractice,
                        maxPracticeNum: maxPracticeNum,
                        practiceNum: practiceNum,
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      shrinkWrap: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
