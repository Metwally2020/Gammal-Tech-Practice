import 'package:flutter/material.dart';

import 'about.dart';
import 'load_the_practice.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: build body too big, separate it into smaller pieces
    return Scaffold(
      appBar: AppBar(
        title: Text('home'), // TODO: capitalization or just remove it
        // TODO: when you go here from home button, push replacement, because you can go back to middle of challenge
        actions: [
          IconButton(
            // TODO: icon button misleading. looks like just logo, not the About screen
            icon: Image.asset('assets/gammal tech.png'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutScreen()));
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
                height: 40,
              ),
              Text(
                // TODO: extract to new widgets or methods
                'Let the\nChallenge Begin!',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    wordSpacing: 1.5,
                    height: 1.5,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Icon(
                Icons.code,
                size: 100,
                color: Colors.white,
              ),
              SizedBox(
                height: 40,
              ),
              InkWell(
                // TODO: extract to new widgets or methods
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoadThePractice(
                                type: 1,
                                practiceNum: 0,
                              )));
                },
                child: Container(
                  // TODO: extract to new widgets or methods
                  height: 60,
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Center(
                    child: Text(
                      '10 Seconds Challenge',
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
                // TODO: use normal ElevatedButtons
                // TODO: extract to new widgets or methods
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoadThePractice(
                                type: 2,
                                practiceNum: 0,
                              )));
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Center(
                    child: Text(
                      '15 Seconds Challenge',
                      style: TextStyle(
                          // TODO: save text style and reuse instead of copy pasting
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
            ],
          ),
        ),
      ),
    );
  }
}
