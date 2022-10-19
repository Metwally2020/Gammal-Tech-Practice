import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 100,
      height: 100,
      child: CircularProgressIndicator(
        color: Colors.white, // TODO: delete code instead of commenting it
        // backgroundColor: Color.fromARGB(255, 197, 222, 219),
        strokeWidth: 10,
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.teal, child: const Center(child: Loader())));
  }
}
