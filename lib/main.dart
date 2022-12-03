import 'package:flutter/material.dart';
import 'package:ruesto/screen/home_screen.dart';
import 'package:ruesto/screen/login_screen.dart';
import 'package:ruesto/screen/register_screen.dart';
import 'package:ruesto/screen/signin_screen.dart';
import 'package:ruesto/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/sign-in': (context) => const SigninScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/register': (context) => RegisterScreen(),
      },
    );
  }
}
