import 'package:flutter/material.dart';

import '../theme/theme.dart';
import '../widget/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  Widget inputSection() {
    Widget emailInput() {
      return CustomTextFormField(
        title: 'Email',
        hintText: '',
        controller: emailController,
      );
    }

    Widget passInput() {
      return CustomTextFormField(
        title: 'Password',
        hintText: '',
        obscureText: true,
        controller: passwordController,
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: kNeutralWhiteColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          emailInput(),
          passInput(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
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
                  height: 160,
                ),
                Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    Container(
                        width: 370,
                        height: 450,
                        decoration: BoxDecoration(
                            color: kNeutralWhiteColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 80),
                          child: Column(
                            children: [
                              Text(
                                'Sign into your account',
                                style: yellowTextStyle.copyWith(
                                    fontSize: 25, fontWeight: bold),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              inputSection(),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/home');
                                },
                                child: Container(
                                  width: 280,
                                  height: 48,
                                  decoration: BoxDecoration(
                                      color: kYellowColor,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Center(
                                    child: Text(
                                      'LOGIN',
                                      style: whiteTextStyle.copyWith(
                                        fontSize: 20,
                                        fontWeight: extraBold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account?",
                                    style: blackTextStyle.copyWith(
                                        fontSize: 15, fontWeight: bold),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/register');
                                    },
                                    child: Text(
                                      'SIGN UP',
                                      style: yellowTextStyle.copyWith(
                                          fontSize: 15, fontWeight: extraBold),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                    Positioned(
                      top: -140,
                      child: Container(
                        height: 208,
                        width: 160,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/logo-ruesto.png'),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
