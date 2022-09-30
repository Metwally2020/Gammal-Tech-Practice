import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_literals_to_create_immutables
    return BottomNavigationBar(
      items: [
        const BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.cow,
              color: Colors.teal,
            ),
            label: 'Courses'),
        const BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.house,
              color: Colors.teal,
            ),
            label: 'Home'),
        const BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.personRifle,
              color: Colors.teal,
            ),
            label: 'Profile'),
      ].toList(),
      onTap: ((value) {
        switch (value) {
          case 0:
            Navigator.pushNamed(context, '/courses');
            break;
          case 1:
            Navigator.pushNamed(context, '/home');
            break;
          case 2:
            Navigator.pushNamed(context, '/profile');
            break;
        }
      }),
    );
  }
}
