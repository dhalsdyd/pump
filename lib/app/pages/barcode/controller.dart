import 'package:firebase_getx_boilerplate/app/core/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/core/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/routes/route.dart';
import 'package:firebase_getx_boilerplate/app/widgets/button.dart';
import 'package:firebase_getx_boilerplate/app/widgets/modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class BarcodeScanPageController extends GetxController with StateMixin {
  final GlobalKey qrKey = GlobalKey();
  final Rx<Barcode?> result = Rx(null);

  final Rx<QRViewController?> controller = Rx(null);

  @override
  void onInit() {
    super.onInit();
  }

  void init() {}

  void resemble() {
    controller.value!.pauseCamera();
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller.value = controller;
    this.controller.value!.resumeCamera();

    controller.scannedDataStream.listen((Barcode barcode) {
      print(barcode.code);
      result.value = barcode;
      showModal(barcode.code!);
    });
  }

  void showModal(String barcode) {
    Get.dialog(FGBPDialog(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/product.jpg",
            width: 50,
            height: 50,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("아모레퍼시픽", style: AppTextTheme.regularGrey),
                const Text("더블이펙터 블랙 샴푸", style: AppTextTheme.bold),
                Text(barcode, style: AppTextTheme.medium16)
              ],
            ),
          ),
          FGBPButton(
            child: const Icon(
              Icons.add,
              size: 40,
              color: AppColorTheme.white,
            ),
            onTap: () {
              Get.toNamed(Routes.payment);
            },
          ),
        ],
      ),
    )));
  }
}
