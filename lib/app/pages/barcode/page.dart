import 'package:firebase_getx_boilerplate/app/core/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/core/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/pages/barcode/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class BarcodeScanPage extends StatelessWidget {
  BarcodeScanPage({Key? key}) : super(key: key);

  final BarcodeScanPageController controller =
      Get.find<BarcodeScanPageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("바코드 조회", style: AppTextTheme.bold18),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
          child: QRView(
        key: controller.qrKey,
        overlay: QrScannerOverlayShape(
            borderColor: AppColorTheme.mainColor,
            borderRadius: 10,
            borderLength: 10,
            borderWidth: 10),
        onQRViewCreated: controller.onQRViewCreated,
      )),
    );
  }
}
