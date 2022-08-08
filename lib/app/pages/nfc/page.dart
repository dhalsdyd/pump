import 'package:firebase_getx_boilerplate/app/core/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/core/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/routes/route.dart';
import 'package:firebase_getx_boilerplate/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class NfcLoadingPage extends StatelessWidget {
  const NfcLoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(44.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LottieBuilder.asset("assets/json/nfc_loading.json"),
                  const SizedBox(height: 18),
                  const Text.rich(TextSpan(children: [
                    TextSpan(text: "스테이션", style: AppTextTheme.extraBoldTitle),
                    TextSpan(text: "에 읽혀주세요", style: AppTextTheme.boldMain),
                  ])),
                  const Text(
                    "스테이션 오른쪽 NFC 리더기에 핸드폰 뒷면을 갖다 대주세요",
                    style: AppTextTheme.regularSmall,
                  ),
                ],
              ),
            ),
            FGBPTextButton(
              text: "완료",
              radius: 12,
              color: AppColorTheme.mainColor,
              onTap: () {
                Get.toNamed(Routes.history);
              },
            ),
            const SizedBox(height: 8),
            FGBPTextButton(
              text: "돌아가기",
              radius: 12,
              color: AppColorTheme.mainColor,
              onTap: () {
                Get.back();
              },
            )
          ],
        ),
      )),
    );
  }
}
