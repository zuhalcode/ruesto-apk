import 'package:ruesto/data/api/api_client.dart';
import 'package:get/get.dart';
import 'package:ruesto/theme/app_constant.dart';

class ProductRepo extends GetxService {
  final ApiClient apiClient;
  ProductRepo({required this.apiClient});

  Future<Response> getProductList() async {
    return await apiClient.getData(AppConstant.PRODUCT_URI);
  }
}
