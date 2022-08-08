import 'package:firebase_getx_boilerplate/app/core/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/core/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/routes/route.dart';
import 'package:firebase_getx_boilerplate/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

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
                  LottieBuilder.asset("assets/json/loading_payment.json"),
                  const SizedBox(height: 18),
                  const Text.rich(TextSpan(children: [
                    TextSpan(
                        text: "3,000원", style: AppTextTheme.extraBoldTitle),
                    TextSpan(text: "결제", style: AppTextTheme.boldMain),
                  ])),
                  const Text(
                    "결제 과정이 추가될 예정입니다.",
                    style: AppTextTheme.regularSmall,
                  ),
                ],
              ),
            ),
            FGBPTextButton(
              text: "결제하기",
              radius: 12,
              color: AppColorTheme.mainColor,
              onTap: () {
                Get.toNamed(Routes.nfc);
              },
            ),
          ],
        ),
      )),
    );
  }
}
