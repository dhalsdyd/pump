import 'package:firebase_getx_boilerplate/app/core/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/core/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          Image.asset("assets/images/logo.png"),
          const Text("PUMP", style: AppTextTheme.extraBoldTitle)
        ]),
        IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none))
      ],
    );
  }

  Widget mainBanner(width) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("주자훈님,", style: AppTextTheme.bold),
            const Text.rich(TextSpan(children: [
              TextSpan(text: "6번", style: AppTextTheme.regularBlack),
              TextSpan(text: "을 지구를 위해 펌프했어요", style: AppTextTheme.medium),
            ])),
            const SizedBox(height: 18),
            Row(
              children: [
                Image.asset("assets/images/tree.png"),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("내가 세운 나무", style: AppTextTheme.boldSmallGrey),
                    Text("8그루", style: AppTextTheme.boldMain),
                  ],
                )
              ],
            ),
            const SizedBox(height: 18),
            const Divider(thickness: 2),
            const SizedBox(height: 18),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: const [
                      Text("3,000P", style: AppTextTheme.boldMain18),
                      Text("보유 포인트", style: AppTextTheme.mediumSmallGrey),
                    ],
                  ),
                  const VerticalDivider(thickness: 2),
                  Column(children: const [
                    Text("5개", style: AppTextTheme.boldMain18),
                    Text("구매 상품", style: AppTextTheme.mediumSmallGrey),
                  ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget subBanner() {
    return Card(
      color: AppColorTheme.mainColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.map);
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.location_on_outlined,
                      color: AppColorTheme.white,
                    ),
                    SizedBox(width: 10),
                    Text("스테이션 찾기", style: AppTextTheme.boldWhite14),
                  ],
                ),
              ),
              // const VerticalDivider(
              //   thickness: 2,
              //   color: AppColorTheme.white,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget community() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("주자훈님!", style: AppTextTheme.bold),
        const Text("최근에 올라온 친환경 이야기를 확인해보세요", style: AppTextTheme.medium16),
        const SizedBox(height: 16),
        Column(
          children: [
            Image.asset("assets/images/eco.png"),
            const SizedBox(height: 16),
            Image.asset("assets/images/eco.png"),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                const SizedBox(height: 22),
                mainBanner(width),
                const SizedBox(height: 22),
                subBanner(),
                const SizedBox(height: 22),
                community()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
