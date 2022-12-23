import 'package:get/get.dart';
import 'package:ruesto/pages/home/food/popular_food_detail.dart';
import 'package:ruesto/pages/home/food/recommended_food.dart';
import 'package:ruesto/pages/home/home_screen.dart';
import 'package:ruesto/screen/login_screen.dart';
import 'package:ruesto/screen/register_screen.dart';
import 'package:ruesto/screen/signin_screen.dart';
import 'package:ruesto/screen/splash_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';

  static String getInitial() => initial;
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getRecommendedFood(int pageId) =>
      '$recommendedFood?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const SplashScreen()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return PopularFoodDetail(
            pageId: int.parse(pageId!),
          );
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return RecommendedFood(pageId: int.parse(pageId!));
        },
        transition: Transition.fadeIn),
    GetPage(
        name: '/sign-in',
        page: () {
          return const SigninScreen();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: '/home',
        page: () {
          return const HomeScreen();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: '/register',
        page: () {
          return RegisterScreen();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: '/login',
        page: () {
          return LoginScreen();
        },
        transition: Transition.fadeIn),
  ];
}
