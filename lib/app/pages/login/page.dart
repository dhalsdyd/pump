import 'package:firebase_getx_boilerplate/app/core/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/widgets/button.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(44),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  SvgPicture.asset("assets/images/logo.svg"),
                  const Text("PUMP", style: AppTextTheme.main)
                ]),
                const Text("버리지 말고 리필하세요", style: AppTextTheme.regularBlack),
              ],
            ),
            Column(
              children: [
                FGBPTextButton(
                  text: "카카오로 계속하기",
                  color: Colors.yellow,
                  radius: 40,
                  onTap: () {
                    //Get.toNamed(Routes);
                  },
                ),
                FGBPTextButton(
                  text: "네이버로 계속하기",
                  color: Colors.greenAccent,
                  radius: 40,
                  onTap: () {},
                ),
                FGBPTextButton(
                  text: "구글로 계속하기",
                  color: Colors.white,
                  radius: 40,
                  onTap: () {},
                ),
                FGBPTextButton(
                  text: "애플로 계속하기",
                  color: Colors.black,
                  radius: 40,
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
