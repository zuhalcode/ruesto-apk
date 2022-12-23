import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ruesto/controllers/product_controller.dart';
import 'package:ruesto/pages/home/home_screen.dart';
// import 'package:get/get.dart';
// import 'package:ruesto/controllers/product_controller.dart';
// import 'package:ruesto/pages/home/home_screen.dart';
import 'package:ruesto/theme/theme.dart';
import 'package:ruesto/widget/app_icon.dart';
import 'package:ruesto/widget/big_text.dart';
import 'package:ruesto/widget/expandable_text.dart';

// ignore: must_be_immutable
class RecommendedFood extends StatelessWidget {
  int pageId;
  RecommendedFood({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<ProductController>().productList[pageId];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.to(const HomeScreen());
                    },
                    child: const AppIcon(icon: Icons.arrow_back_ios)),
                const AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Center(
                    child: BigText(
                  size: 26,
                  text: product.name!
                      .split(' ')
                      .map((word) => word[0].toUpperCase() + word.substring(1))
                      .join(' '),
                )),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.kYellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                product.image!.replaceAll('productImages\\', 'assets/'),
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [ExpandableText(text: product.desc!)],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  iconColor: Colors.white,
                  backgroundColor: kYellowColor,
                  iconSize: 24,
                ),
                BigText(
                    text: "\$ ${product.price} X 0",
                    color: AppColors.kNeutralBlackColor,
                    size: 26),
                AppIcon(
                  icon: Icons.add,
                  iconColor: Colors.white,
                  backgroundColor: kYellowColor,
                  iconSize: 24,
                ),
              ],
            ),
          ),
          Container(
            height: 110,
            padding:
                const EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
            decoration: const BoxDecoration(
                color: AppColors.kBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 15, left: 20, right: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.redAccent,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 20, right: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kYellowColor),
                  child: BigText(
                    text: "\$ ${product.price} | Add to cart",
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
