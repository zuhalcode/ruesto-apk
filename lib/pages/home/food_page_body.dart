// import 'package:flutter/cupertino.dart';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ruesto/controllers/product_controller.dart';
import 'package:ruesto/models/product_model.dart';
import 'package:ruesto/pages/home/food/popular_food_detail.dart';
import 'package:ruesto/routes/route_helper.dart';
// import 'package:ruesto/theme/app_constant.dart';
import 'package:ruesto/theme/theme.dart';
import 'package:ruesto/theme/dimensions.dart';
import 'package:ruesto/widget/app_column.dart';
import 'package:ruesto/widget/big_text.dart';
import 'package:ruesto/widget/icon_and_text.dart';
import 'package:ruesto/widget/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Slider section
        GetBuilder<ProductController>(builder: (products) {
          return products.isLoaded
              ? SizedBox(
                  height: 320,
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: products.productList.length,
                      itemBuilder: (context, position) {
                        return _buildPageItem(
                            position, products.productList[position]);
                      }),
                )
              : const CircularProgressIndicator(
                  color: AppColors.kNeutralGreyColor,
                );
        }),
        // Dots
        GetBuilder<ProductController>(builder: (products) {
          return DotsIndicator(
            dotsCount:
                products.productList.isEmpty ? 1 : products.productList.length,
            position: _currentPageValue,
            decorator: DotsDecorator(
                activeColor: AppColors.kYellowColor,
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          );
        }),
        // popular text
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            children: [
              BigText(text: "Popular"),
              const SizedBox(
                width: 10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 2),
                child: SmallText(text: "Food pairing"),
              )
            ],
          ),
        ),
        // list food and image
        GetBuilder<ProductController>(builder: (products) {
          return products.isLoaded
              ? ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: products.productList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getRecommendedFood(index));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 10),
                        child: Row(
                          children: [
                            // image section
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white38,
                                  image: DecorationImage(
                                      image: AssetImage(products
                                          .productList[index].image!
                                          .replaceAll(
                                              'productImages\\', 'assets/')),
                                      fit: BoxFit.cover)),
                            ),

                            // text container
                            Expanded(
                              child: Container(
                                height: 100,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                    color: Colors.white),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      BigText(
                                          text: products
                                              .productList[index].name!
                                              .split(' ')
                                              .map((word) =>
                                                  word[0].toUpperCase() +
                                                  word.substring(1))
                                              .join(' ')),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SmallText(
                                          text: "With chinese caracteristuc"),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          IconAndText(
                                              icon: Icons.circle_sharp,
                                              text: "Normal",
                                              iconColor:
                                                  AppColors.kYellowColor),
                                          IconAndText(
                                              icon: Icons.location_on,
                                              text: "1.7km",
                                              iconColor: AppColors
                                                  .kSecondaryBlueColor),
                                          IconAndText(
                                              icon: Icons.access_time_rounded,
                                              text: "32min",
                                              iconColor: AppColors.kGreyColor),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
              : const CircularProgressIndicator(color: AppColors.kGreyColor);
        })
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel products) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(1, currentTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else {
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getPopularFood(index));
            },
            child: Container(
              height: 220,
              margin: const EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: index.isEven
                      ? const Color(0xFF69c5df)
                      : const Color(0xFF9294cc),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(products.image!
                        .replaceAll("productImages\\", "assets/")),
                  )),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                  ]),
              child: Container(
                padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                child: AppColumn(
                  text: products.name!
                      .split(' ')
                      .map((word) => word[0].toUpperCase() + word.substring(1))
                      .join(' '),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
