import 'package:firebase_getx_boilerplate/app/core/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/core/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/pages/home/page.dart';
import 'package:firebase_getx_boilerplate/app/pages/profile/page.dart';
import 'package:firebase_getx_boilerplate/app/pages/store/page.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(12),
          topLeft: Radius.circular(12),
        ),
        child: BottomNavigationBar(
          elevation: 5.0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColorTheme.white,
          selectedItemColor: AppColorTheme.mainColor,
          unselectedItemColor: AppColorTheme.grey,
          selectedLabelStyle: AppTextTheme.boldMain18,
          unselectedLabelStyle: AppTextTheme.boldSmallGrey,
          currentIndex: selectedIndex, //현재 선택된 Index
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: "홈",
              icon: Icon(Icons.home_outlined),
            ),
            BottomNavigationBarItem(
              label: "스토어",
              icon: Icon(Icons.local_grocery_store_outlined),
            ),
            BottomNavigationBarItem(
              label: "마이",
              icon: Icon(Icons.person_outline),
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> widgetOptions = [
  HomePage(),
  const StorePage(),
  const ProfilePage()
];
