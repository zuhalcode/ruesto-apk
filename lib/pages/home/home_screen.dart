import 'package:flutter/material.dart';
import 'package:ruesto/pages/home/food_page_body.dart';
import 'package:ruesto/theme/theme.dart';
import 'package:ruesto/widget/big_text.dart';
import 'package:ruesto/widget/small_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        // header
        Container(
          margin: const EdgeInsets.only(top: 45, bottom: 15),
          padding: const EdgeInsets.only(left: 20, right: 20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              children: [
                BigText(
                  text: 'Surabaya',
                  color: AppColors.kYellowColor,
                ),
                Row(
                  children: [
                    SmallText(
                      text: "Zuhal",
                      color: Colors.black,
                    ),
                    const Icon(Icons.arrow_drop_down_rounded)
                  ],
                ),
              ],
            ),
            Center(
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.kYellowColor,
                ),
                child: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            )
          ]),
        ),
        // body
        const Expanded(
            child: SingleChildScrollView(
          child: FoodPageBody(),
        )),
      ],
    ));
  }
}
