import 'package:flutter/material.dart';
import 'package:ruesto/theme/theme.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background.png'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                //changes your type font in theme.dart
                "RUESTO",
                style: secondWhiteTextStyle.copyWith(
                  fontSize: 80,
                  fontWeight: black,
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Container(
                height: 300,
                width: 230,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/logo-ruesto.png'),
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (Route<dynamic> route) => false);
                },
                child: Container(
                  width: 326,
                  height: 63,
                  decoration: BoxDecoration(
                      color: kYellowColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Text(
                      'SIGN IN',
                      style: whiteTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: extraBold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: whiteTextStyle.copyWith(
                        fontSize: 18, fontWeight: reguler),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(context, '/register',
                          (Route<dynamic> route) => false);
                    },
                    child: Text(
                      'SIGN UP',
                      style: yellowTextStyle.copyWith(
                          fontSize: 18, fontWeight: extraBold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
