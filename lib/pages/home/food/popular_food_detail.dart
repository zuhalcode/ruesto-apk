import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ruesto/controllers/product_controller.dart';
import 'package:ruesto/pages/home/home_screen.dart';
// import 'package:ruesto/pages/home/home_screen.dart';
import 'package:ruesto/theme/dimensions.dart';
import 'package:ruesto/theme/theme.dart';
import 'package:ruesto/widget/app_column.dart';
import 'package:ruesto/widget/app_icon.dart';
import 'package:ruesto/widget/big_text.dart';
import 'package:ruesto/widget/expandable_text.dart';

class PopularFoodDetail extends StatelessWidget {
  int pageId;
  PopularFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<ProductController>().productList[pageId];
    print('page is id' + pageId.toString());
    print('product name is ' + product.toString());
    print(product.price);
    return Scaffold(
        body: Stack(
          children: [
            // background image
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(product.image!
                            .replaceAll('productImages\\', 'assets/')),
                        fit: BoxFit.cover)),
              ),
            ),
            // icon widget
            Positioned(
              top: 30,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.to(() => const HomeScreen());
                      },
                      child: const AppIcon(icon: Icons.arrow_back_ios)),
                  const AppIcon(icon: Icons.shopping_cart_checkout_outlined)
                ],
              ),
            ),
            // introduction of food
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(
                      text: product.name!
                          .split(' ')
                          .map((word) =>
                              word[0].toUpperCase() + word.substring(1))
                          .join(' '),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BigText(text: "Introduce"),
                    // expandable text widget
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(top: 10),
                        child: ExpandableText(text: product.desc.toString()),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: GetBuilder<ProductController>(
          builder: (popularProduct) {
            return Container(
              height: 110,
              padding: const EdgeInsets.only(
                  top: 30, bottom: 30, left: 20, right: 20),
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
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            popularProduct.setQuantity(false);
                          },
                          child: const Icon(
                            Icons.remove,
                            color: AppColors.kNeutralGreyColor,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        BigText(text: popularProduct.quantity.toString()),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            popularProduct.setQuantity(true);
                          },
                          child: const Icon(
                            Icons.add,
                            color: AppColors.kNeutralGreyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 20, right: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kYellowColor),
                    child: BigText(
                      text: "\$ ${product.price}  | Add to cart",
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}
