import 'package:flutter_application/model/kategori_response.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final _getConnect = GetConnect();

  Future<KategoryResponse> getKategori() async {
    final response = await _getConnect.get('https://reqres.in/api/users');
    return KategoryResponse.fromJson(response.body);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
