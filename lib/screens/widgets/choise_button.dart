import 'package:flutter/material.dart' hide BoxShadow, BoxDecoration;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

// ignore: must_be_immutable
class ChoiceButton extends StatelessWidget {
  void Function()? onTap;

  ChoiceButton({super.key, required this.onTap, });

  @override
  Widget build(BuildContext context) {
    Offset distance =  Offset(10, 10);
    double blur =  30.0;
    return InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 150,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 0, 212, 191),
                    blurRadius: blur,
                    offset: -distance,
                    inset: false,
                  ),
                  BoxShadow(
                      color: Color.fromARGB(255, 0, 46, 41),
                      blurRadius: blur,
                      offset: distance,
                      inset: false),
                ]),
            child: Center(
              child: Text(
                'Found it',
                style: const TextStyle(
                    wordSpacing: 1.5,
                    height: 1.5,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ));
  }
}
