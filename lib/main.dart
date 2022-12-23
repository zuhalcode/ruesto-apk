import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ruesto/controllers/product_controller.dart';
// import 'package:ruesto/pages/home/food/popular_food_detail.dart';
// import 'package:ruesto/pages/home/food/recommended_food.dart';
import 'package:ruesto/pages/home/home_screen.dart';
import 'package:ruesto/screen/splash_screen.dart';
// import 'package:ruesto/home/main_food_page.dart';
// import 'package:ruesto/pages/home/home_screen.dart';
// import 'package:ruesto/screen/login_screen.dars
import 'helpers/dependencies.dart' as dep;
import 'routes/route_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<ProductController>().getProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      home: const SplashScreen(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
      // routes: {
      //   '/': (context) => const SplashScreen(),
      //   '/sign-in': (context) => const SigninScreen(),
      //   '/login': (context) => LoginScreen(),
      //   '/home': (context) => const HomeScreen(),
      //   '/register': (context) => RegisterScreen(),
      // },
    );
  }
}
