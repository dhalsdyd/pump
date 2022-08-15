import 'package:firebase_getx_boilerplate/app/core/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/core/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FGBPSnackBar {
  static void openOne(String title, String one) {
    Get.rawSnackbar(
      onTap: (_) {
        Get.back();
      },
      titleText: Text(title, style: AppTextTheme.boldMain18),
      messageText: Text(one, style: AppTextTheme.semiboldMain20),
      isDismissible: true,
      backgroundColor: AppColorTheme.white,
      mainButton: FGBPTextButton(
        text: "확인",
        radius: 10,
        onTap: () {
          Get.back();
        },
      ),
    );
  }
}
