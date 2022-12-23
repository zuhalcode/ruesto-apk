import 'package:flutter/cupertino.dart';
import 'package:ruesto/theme/theme.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  double height;

  SmallText(
      {Key? key,
      this.color = AppColors.kGreyColor,
      required this.text,
      this.size = 13,
      this.height = 1.2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontFamily: 'Roboto',
            color: color,
            fontSize: size,
            height: height,
            fontWeight: FontWeight.w400));
  }
}
