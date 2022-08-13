import 'package:firebase_getx_boilerplate/app/pages/barcode/controller.dart';
import 'package:get/get.dart';

class BarcodeScanPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BarcodeScanPageController>(() => BarcodeScanPageController());
  }
}
