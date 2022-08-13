import 'package:firebase_getx_boilerplate/app/pages/barcode/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class BarcodeScanPage extends StatefulWidget {
  BarcodeScanPage({Key? key}) : super(key: key);

  @override
  State<BarcodeScanPage> createState() => _BarcodeScanPageState();
}

class _BarcodeScanPageState extends State<BarcodeScanPage> {
  final BarcodeScanPageController controller =
      Get.find<BarcodeScanPageController>();

  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  void reassemble() {
    controller.resemble();
    super.reassemble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: QRView(
        key: controller.qrKey,
        onQRViewCreated: controller.onQRViewCreated,
      )),
    );
  }
}
