import 'package:get/get.dart';
import 'package:ruesto/controllers/product_controller.dart';
import 'package:ruesto/data/api/api_client.dart';
import 'package:ruesto/data/repository/product_repo.dart';
import 'package:ruesto/theme/app_constant.dart';

Future<void> init() async {
  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstant.BASE_URL));
  // repos
  Get.lazyPut(() => ProductRepo(apiClient: Get.find()));
  // controllers
  Get.lazyPut(() => ProductController(productRepo: Get.find()));
}
