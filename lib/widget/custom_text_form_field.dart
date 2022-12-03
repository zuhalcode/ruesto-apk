import 'package:flutter/material.dart';

import '../theme/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const CustomTextFormField({
    Key? key,
    required this.title,
    required this.hintText,
    this.obscureText = false,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: greyTextStyle.copyWith(fontSize: 14, fontWeight: extraBold),
          ),
          const SizedBox(
            height: 6,
          ),
          TextFormField(
            cursorColor: kNeutralBlackColor,
            obscureText: obscureText,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: kNeutralWhiteColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
