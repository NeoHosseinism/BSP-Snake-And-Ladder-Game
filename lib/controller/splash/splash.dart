import 'package:get/get.dart';

class SplashCtrl extends GetxController {
  @override
  Future<void> onInit() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAllNamed("/home");
    super.onInit();
  }
}
