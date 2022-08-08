import 'package:firebase_getx_boilerplate/app/data/initalize.dart';
import 'package:firebase_getx_boilerplate/app/routes/pages.dart';
import 'package:firebase_getx_boilerplate/app/routes/route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Do Firebase Initial Settings With Firebase CLI
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }
  await AppInitalizer().init();
  runApp(GetMaterialApp(
    initialRoute: Routes.root,
    getPages: AppPages.pages,
    theme: ThemeData(fontFamily: "Pretendard"),
  ));
}
