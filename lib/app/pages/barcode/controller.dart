import 'dart:async';

import 'package:firebase_getx_boilerplate/app/core/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/core/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/routes/route.dart';
import 'package:firebase_getx_boilerplate/app/widgets/button.dart';
import 'package:firebase_getx_boilerplate/app/widgets/modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class BarcodeScanPageController extends GetxController with StateMixin {
  Completer<void>? _showModalCompleter;
  final RxBool _checkOpenModal = false.obs;
  final GlobalKey qrKey = GlobalKey();
  final Rx<Barcode?> result = Rx(null);
  final Rx<QRViewController?> controller = Rx(null);

  void resemble() {
    controller.value!.pauseCamera();
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller.value = controller;
    this.controller.value!.resumeCamera();

    controller.scannedDataStream.listen((Barcode barcode) {
      result.value = barcode;

      if (_showModalCompleter == null || _showModalCompleter!.isCompleted) {
        _showModalCompleter = Completer();
        _autoDissmisDialog();
      }
    });
  }

  void _autoDissmisDialog() {
    showModal();
    Future.delayed(const Duration(seconds: 5), () {
      if (_checkOpenModal.value == true) {
        Get.back();
        _showModalCompleter!.complete();
      }
    });
  }

  void showModal() {
    _checkOpenModal.value = true;
    Get.dialog(FGBPDialog(
        borderColor: AppColorTheme.mainColor,
        alignment: Alignment.bottomCenter,
        child: Row(
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
                  const Text("더블이펙터 블랙 샴푸", style: AppTextTheme.bold18),
                  Text(result.value!.code!, style: AppTextTheme.medium16)
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
                _checkOpenModal.value = false;
                _showModalCompleter!.complete();
                Get.toNamed(Routes.payment);
              },
            ),
          ],
        )));
  }
}
