import 'dart:async';

import 'package:flutter/material.dart';

import '../theme/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 5), () {
      Navigator.pushNamed(context, '/sign-in');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kNeutralWhiteColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 230,
            height: 300,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/logo-ruesto.png',
                ),
              ),
            ),
          ),
          Text(
            'RUESTO',
            style: secondBlackTextStyle.copyWith(
              fontSize: 40,
              fontWeight: bold,
              letterSpacing: 5,
            ),
          )
        ],
      )),
    );
  }
}
