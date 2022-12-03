import 'package:flutter/material.dart';
import 'package:ruesto/theme/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text(
          'HELLO THIS IS HOMEPAGE',
          style: yellowTextStyle.copyWith(fontSize: 50, fontWeight: bold),
        ),
      ),
    );
  }
}
