import 'package:firebase_getx_boilerplate/app/core/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/core/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/widgets/button.dart';
import 'package:flutter/material.dart';

class DetailProductPage extends StatelessWidget {
  const DetailProductPage({
    Key? key,
    required this.imgUrl,
    required this.title,
    required this.content,
    required this.price,
  }) : super(key: key);

  final String imgUrl;
  final String title;
  final String content;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("주문하기", style: AppTextTheme.boldGray18),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColorTheme.grey,
        elevation: 0,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Expanded(child: Image.asset(imgUrl, fit: BoxFit.fill))
            ]),
            const SizedBox(height: 18),
            Text(title, style: AppTextTheme.bold),
            const SizedBox(height: 18),
            Text(content),
            const SizedBox(height: 18),
            Text(price, style: AppTextTheme.boldMain18),
            const SizedBox(height: 18),
            const FGBPTextButton(text: "구매하기"),
          ],
        ),
      )),
    );
  }
}
