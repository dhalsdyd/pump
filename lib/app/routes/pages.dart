import 'package:firebase_getx_boilerplate/app/pages/barcode/binding.dart';
import 'package:firebase_getx_boilerplate/app/pages/barcode/page.dart';
import 'package:firebase_getx_boilerplate/app/pages/check/page.dart';
import 'package:firebase_getx_boilerplate/app/pages/home/binding.dart';
import 'package:firebase_getx_boilerplate/app/pages/home/page.dart';
import 'package:firebase_getx_boilerplate/app/pages/login/page.dart';
import 'package:firebase_getx_boilerplate/app/pages/map/map.dart';
import 'package:firebase_getx_boilerplate/app/pages/nfc/binding.dart';
import 'package:firebase_getx_boilerplate/app/pages/nfc/page.dart';
import 'package:firebase_getx_boilerplate/app/pages/payment/page.dart';
import 'package:firebase_getx_boilerplate/app/pages/root/root.dart';
import 'package:firebase_getx_boilerplate/app/routes/route.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.home, page: () => HomePage(), binding: HomePageBinding()),
    GetPage(
        name: Routes.barcodeScan,
        page: () => BarcodeScanPage(),
        binding: BarcodeScanPageBinding()),
    GetPage(
        name: Routes.nfc,
        page: () => NfcLoadingPage(),
        binding: NfcLoadingPageBinding()),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
    ),
    GetPage(
        name: Routes.root,
        page: () => const RootPage(),
        binding: HomePageBinding()),
    GetPage(
      name: Routes.history,
      page: () => HistoryPage(),
    ),
    GetPage(
      name: Routes.map,
      page: () => const MapSample(),
    ),
    GetPage(
      name: Routes.payment,
      page: () => const PaymentPage(),
    ),
  ];
}
