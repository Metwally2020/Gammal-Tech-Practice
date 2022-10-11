import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gammal_tech_practice/screens/home.dart';
import 'package:flutter/services.dart';
import 'package:gammal_tech_practice/services/auth.dart';
import 'firebase_options.dart';
import 'onboarding/onboarding_screen.dart';
bool isLogidIn = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  var user = AuthService().currerntuser;
  user == null ? isLogidIn = false : isLogidIn = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/home': (context) => HomeScreen(),
        },
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.teal,
            elevation: 0,
          ),
          scaffoldBackgroundColor: Colors.teal,
        ),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: isLogidIn == false ? OnboardingScreen() : HomeScreen());
  }
}
