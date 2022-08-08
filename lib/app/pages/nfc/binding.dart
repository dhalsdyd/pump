import 'package:firebase_getx_boilerplate/app/pages/nfc/controller.dart';
import 'package:get/get.dart';

class NfcLoadingPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NfcLoadingPageController>(() => NfcLoadingPageController());
  }
}
