import 'package:firebase_getx_boilerplate/app/core/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/core/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/routes/route.dart';
import 'package:firebase_getx_boilerplate/app/widgets/button.dart';
import 'package:firebase_getx_boilerplate/app/widgets/modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class BarcodeScanPage extends StatefulWidget {
  const BarcodeScanPage({Key? key}) : super(key: key);

  @override
  State<BarcodeScanPage> createState() => _BarcodeScanPageState();
}

class _BarcodeScanPageState extends State<BarcodeScanPage> {
  @override
  void initState() {
    startBarcode();
    super.initState();
  }

  Future<void> startBarcode() async {
    final barcode = await FlutterBarcodeScanner.scanBarcode(
        '#ff4CA76A', '나가기', true, ScanMode.BARCODE);
    showModal(barcode);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    startBarcode();
                  },
                  child: const Text("다시 찍기", style: AppTextTheme.big))
            ],
          ),
        ),
      ),
    );
  }
}
