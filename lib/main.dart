import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gammal_tech_practice/screens/home.dart'; // TODO: use relative imports
import 'package:flutter/services.dart';
import 'package:gammal_tech_practice/services/auth.dart'; // TODO: use relative imports
import 'firebase_options.dart';
import 'onboarding/onboarding_screen.dart';

// TODO: order imports according to standards

bool isLoggedIn = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  var user = AuthService().currerntuser;
  isLoggedIn = user != null;
  // user == null ? isLoggedIn = false : isLoggedIn = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/home': (context) => HomeScreen(),
          // TODO: why use routes if there is only one route?
        },
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            // TODO: having the appbar the same color as body is not standard (does not follow guidelines)
            color: Colors.teal,
            elevation: 0,
          ),
          scaffoldBackgroundColor: Colors.teal,
        ),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo', // TODO: change title or remove
        home: isLoggedIn == false ? OnboardingScreen() : HomeScreen());
  }
}
