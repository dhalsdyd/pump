import 'package:firebase_getx_boilerplate/app/core/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/core/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("프로필", style: AppTextTheme.bold18),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          foregroundColor: Colors.black,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                profile(),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [userCard(), history()],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Card userCard() {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          userInfo("이름", "주자훈"),
          userInfo("생년월일", "05.08.04"),
          userInfo("지킴이", "22.2K"),
        ],
      ),
    ));
  }

  Column userInfo(String title, String content) {
    return Column(
      children: [
        Text(title, style: AppTextTheme.mediumGrey),
        const SizedBox(height: 5.0),
        Text(
          content,
          style: AppTextTheme.medium16,
        )
      ],
    );
  }

  Widget profile() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColorTheme.mainColor, AppColorTheme.subColor],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(radius: 65.0, backgroundColor: Colors.white),
                  SizedBox(height: 10.0),
                  Text('자훈', style: AppTextTheme.boldWhite18),
                  SizedBox(height: 10.0),
                  Text('지구 방위대 등급', style: AppTextTheme.boldWhite14)
                ]),
          ),
        ),
      ],
    );
  }

  Widget history() {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("PUMP 활동 내역", style: AppTextTheme.medium16),
          Divider(color: Colors.grey[300]),
          activityHistory(title: "자훈님이 자주 간 지역", content: "이마트24 안산디지털고점"),
          const SizedBox(height: 20.0),
          activityHistory(
              icon: Icons.favorite,
              title: "자훈님이 좋아하는 제품",
              content: "더블이펙터 블랙샴푸"),
          const SizedBox(height: 20.0),
          activityHistory(
              icon: Icons.auto_awesome,
              title: "PUMP에서 추천하는 제품",
              content: "더블이펙터 블랙샴푸"),
          const SizedBox(height: 20.0),
          activityHistory(
              icon: Icons.people, title: "친환경 제품 판매 횟수", content: "5번"),
          const SizedBox(height: 20.0),
        ],
      ),
    ));
  }

  Row activityHistory({
    IconData icon = Icons.home,
    String title = "집",
    String content = "좋아요",
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon, color: AppColorTheme.mainColor, size: 35),
        const SizedBox(width: 20.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTextTheme.medium16),
            Text(content, style: AppTextTheme.mediumGrey)
          ],
        )
      ],
    );
  }
}
