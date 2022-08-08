import 'package:firebase_getx_boilerplate/app/core/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/core/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/routes/route.dart';
import 'package:firebase_getx_boilerplate/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  Widget success() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: AppColorTheme.mainColor,
      child: Padding(
        padding: const EdgeInsets.all(27.0),
        child: Center(
          child: Column(children: [
            Image.asset("assets/images/check.png"),
            const SizedBox(height: 18),
            const Text("리필 완료", style: AppTextTheme.semiboldWhite22),
            const Text("지구의 심장에 펌프하였습니다!", style: AppTextTheme.regularWhite12),
          ]),
        ),
      ),
    );
  }

  Widget payments() {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(27.0),
        child: Center(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("리필 항목", style: AppTextTheme.mediumGrey),
                Text("주방 세재", style: AppTextTheme.semiboldGrey16),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("리필 장소", style: AppTextTheme.mediumGrey),
                Text("이마트24 안산디지털점", style: AppTextTheme.semiboldGrey16),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("리필 일시", style: AppTextTheme.mediumGrey),
                Text("2022.07.12", style: AppTextTheme.semiboldGrey16),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("적립 포인트", style: AppTextTheme.mediumGrey),
                Text("+ 500P", style: AppTextTheme.semiboldGrey16),
              ],
            ),
            const SizedBox(height: 30),
            const Divider(thickness: 3),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("결제 금액", style: AppTextTheme.boldGray18),
                Text("3,000원", style: AppTextTheme.semiboldMain20),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("내역확인", style: AppTextTheme.boldGray18),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.grey,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    success(),
                    payments(),
                  ],
                ),
              ),
            ),
            FGBPTextButton(
              text: "완료",
              color: AppColorTheme.mainColor,
              radius: 12,
              onTap: () {
                Get.offNamed(Routes.root);
              },
            )
          ],
        ),
      )),
    );
  }
}
