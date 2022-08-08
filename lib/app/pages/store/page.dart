import 'package:carousel_slider/carousel_slider.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:firebase_getx_boilerplate/app/core/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/core/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/pages/detail/page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
    //print(slides);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  Widget header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          Image.asset("assets/images/logo.png"),
          const Text("PUMP", style: AppTextTheme.extraBoldTitle)
        ]),
        IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined))
      ],
    );
  }

  Widget contentBody() {
    return SizedBox(
      width: double.infinity,
      child: ContainedTabBarView(
        tabs: const [
          Text("홈"),
          Text("인기"),
          Text("최신"),
          Text("음식"),
          Text("패션"),
          Text("뷰티"),
          Text("리빙"),
        ],
        tabBarProperties: const TabBarProperties(
          indicatorColor: AppColorTheme.mainColor,
          labelStyle: AppTextTheme.boldMain18,
          unselectedLabelStyle: AppTextTheme.boldGray18,
          labelColor: AppColorTheme.mainColor,
          unselectedLabelColor: Colors.grey,
        ),
        views: [
          content(),
          content(),
          content(),
          content(),
          content(),
          content(),
          content(),
        ],
      ),
    );
  }

  Widget cardWiget(String asset, String title, String content, String price) {
    return InkWell(
      onTap: () {
        Get.to(DetailProductPage(
          imgUrl: asset,
          title: title,
          content: content,
          price: price,
        ));
      },
      child: Card(
        child: Center(
          child: Column(children: [
            Image.asset(asset),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextTheme.regularSmall),
                  Text(price, style: AppTextTheme.semiboldMain20),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget content() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                    reverse: false,
                    autoPlay: true,
                    onPageChanged: (index, _) {
                      setState(() {
                        currentIndex = index;
                      });
                    }),
                items: [1, 2, 3, 4, 5].map((i) {
                  return Image.asset(
                    "assets/images/test3.png",
                    width: double.infinity,
                  );
                }).toList(),
              ),
              Positioned(
                top: 10,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColorTheme.mainColor),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("${currentIndex + 1} / 5",
                        style: AppTextTheme.mediumWhite),
                  ),
                ),
              )
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [1, 2, 3, 4, 5].map((i) {
              //     return Builder(
              //       builder: (BuildContext context) {
              //         return Container(
              //           width: 8.0,
              //           height: 8.0,
              //           margin: const EdgeInsets.symmetric(
              //               vertical: 10.0, horizontal: 2.0),
              //           decoration: BoxDecoration(
              //               border: Border.all(color: AppColorTheme.mainColor),
              //               shape: BoxShape.circle,
              //               color: currentIndex + 1 == i
              //                   ? AppColorTheme.mainColor
              //                   : AppColorTheme.white),
              //         );
              //       },
              //     );
              //   }).toList(),
              // ),
            ],
          ),
          const SizedBox(height: 12),
          const Text("리필을 통해 얻어", style: AppTextTheme.bold),
          const Text.rich(TextSpan(children: [
            TextSpan(text: "친환경 제품", style: AppTextTheme.regularBlackUnder),
            TextSpan(text: "을 구매해보아요", style: AppTextTheme.medium),
          ])),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: cardWiget(
                    "assets/images/test1.png",
                    "마이아일랜드 휴대용 대나무 커트러리 세트",
                    "여전히 편의점이나 마트에서 익숙하게 마주하는 흰색 일회용 플 라스틱 커트러리들을 대산해서 외출시, 캠핑이나 간단한 나들이 등 야와 활동시, 언제 어디에서나 가방에서 꺼내 지속적으로 오래 사용할 수 있는 제품입니다. 친환경 라이프가 자칫 어렵고 부담스 럽지 않도록, 텀블러처럼 누구나 쉽고 편리하게 접근 할 수 있는 나만의 에코 아이템이라서 참 좋습니다.",
                    "15,000원"),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: cardWiget(
                    "assets/images/test2.png",
                    "마이아일랜드 휴대용 대나무 칫솔 가족세트",
                    "여전히 편의점이나 마트에서 익숙하게 마주하는 흰색 일회용 플 라스틱 커트러리들을 대산해서 외출시, 캠핑이나 간단한 나들이 등 야와 활동시, 언제 어디에서나 가방에서 꺼내 지속적으로 오래 사용할 수 있는 제품입니다. 친환경 라이프가 자칫 어렵고 부담스 럽지 않도록, 텀블러처럼 누구나 쉽고 편리하게 접근 할 수 있는 나만의 에코 아이템이라서 참 좋습니다.",
                    "19,800원"),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            children: [
              header(),
              Expanded(child: contentBody()),
            ],
          ),
        ),
      ),
    );
  }
}
