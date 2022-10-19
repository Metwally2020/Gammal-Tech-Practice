import 'package:flutter/material.dart';
import '../services/auth.dart';

// TODO: the previous page also said "START"
// TODO: rename widget and file to something more descipriont, e.g., StartScreen
// Start could have many meanings
class Start extends StatelessWidget {
  const Start({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.teal, elevation: 0),
      // TODO: just remove the appbar then
      body: Container(
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        // TODO: why is this constraint used here?
        decoration: BoxDecoration(color: Colors.teal),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(), // why?
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text(
                'Gammal Tech\nPractice',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              Image.asset(
                'assets/gammal tech.png',
                width: MediaQuery.of(context).size.width,
                height: 250,
              ),
              SizedBox(height: 50),
              // TODO: why InkWell? why not just use an ElevatedButton?
              InkWell(
                onTap: () => AuthService().anonLogin(context: context),
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Center(
                    child: Text(
                      'Start',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
