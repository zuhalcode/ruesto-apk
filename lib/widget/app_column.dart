import 'package:flutter/material.dart';
import 'package:ruesto/theme/theme.dart';
import 'package:ruesto/widget/icon_and_text.dart';
import 'package:ruesto/widget/small_text.dart';

import 'big_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: 26,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) {
                  return const Icon(
                    Icons.star,
                    color: AppColors.kYellowColor,
                    size: 15,
                  );
                },
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SmallText(text: "4.5"),
            const SizedBox(
              width: 10,
            ),
            SmallText(text: "1287"),
            const SizedBox(
              width: 10,
            ),
            SmallText(text: "comments"),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            IconAndText(
                icon: Icons.circle_sharp,
                text: "Normal",
                iconColor: AppColors.kYellowColor),
            IconAndText(
                icon: Icons.location_on,
                text: "1.7km",
                iconColor: AppColors.kSecondaryBlueColor),
            IconAndText(
                icon: Icons.access_time_rounded,
                text: "32min",
                iconColor: AppColors.kGreyColor),
          ],
        )
      ],
    );
  }
}
